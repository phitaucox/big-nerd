//
//  PhotoStore.swift
//  Photorama
//
//  Created by Cox, Christian on 5/12/16.
//  Copyright © 2016 Cox, Christian. All rights reserved.
//

import UIKit
import CoreData

enum ImageResult {
    case Success(UIImage)
    case Failure(ErrorType)
}

enum PhotoError: ErrorType {
    case ImageCreationError
}

class PhotoStore {
    
    // MARK: Declarations
    let coreDataStack = CoreDataStack(modelName: "Photorama")
    let session : NSURLSession = {
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        return NSURLSession(configuration: config)
    }()
    
    // MARK: Unmarked
    func fetchInterestingPhotos(completion completion: (PhotosResult) -> Void) {
        
        let url = FlickrAPI.interestingPhotosURL()
        let request = NSURLRequest(URL: url)
        let task = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
            var result = self.processPhotosRequest(data: data, error: error)
            
            if case let .Success(photos) = result {
                let mainQueueContext = self.coreDataStack.mainQueueContext
                mainQueueContext.performBlockAndWait() {
                    try! mainQueueContext.obtainPermanentIDsForObjects(photos)
                }
                let objectIDs = photos.map{ $0.objectID }
                let predicate = NSPredicate(format: "self IN %@", objectIDs)
                let sortByDateTaken =
                
                do {
                    try self.coreDataStack.saveChanges()
                }
                catch let error {
                    result = .Failure(error)
                }
            }
            
            completion(result)
        }
        task.resume()
    }
    
    func processPhotosRequest(data data: NSData?, error: NSError?) -> PhotosResult {
        
        guard let jsonData = data else {
            return .Failure(error!)
        }

        return FlickrAPI.photosFromJSONData(jsonData, inContext: self.coreDataStack.mainQueueContext)
    }
    
    func fetchImageForPhoto(photo: Photo, completion: (ImageResult) -> Void) {
        
        if let image = photo.image {
            completion(.Success(image))
            return
        }
        
        let photoURL = photo.remoteURL
        let request = NSURLRequest(URL: photoURL)
        
        let task = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
            let result = self.processImageRequest(data: data, error: error)
            
            if case let .Success(image) = result {
                photo.image = image
            }
            
            completion(result)
        }
        task.resume()
    }
    
    func processImageRequest(data data: NSData?, error: NSError?) -> ImageResult {
        
        guard let imageData = data, image = UIImage(data: imageData) else {
            // Couldn't create an image
            if data == nil {
                return .Failure(error!)
            }
            else {
                return .Failure(PhotoError.ImageCreationError)
            }
        }
        
        return .Success(image)
    }
    
    func fetchMainQueuePhotos(predicate predicate: NSPredicate? = nil, sortDescriptors: [NSSortDescriptor]? = nil) throws -> [Photo] {
        
        let fetchRequest = NSFetchRequest(entityName: "Photo")
        fetchRequest.sortDescriptors = sortDescriptors
        fetchRequest.predicate = predicate
        
        let mainQueueContext = self.coreDataStack.mainQueueContext
        var mainQueuePhotos: [Photo]?
        var fetchRequestError: ErrorType?
        mainQueueContext.performBlockAndWait() {
            do {
                mainQueuePhotos = try mainQueueContext.executeFetchRequest(fetchRequest) as? [Photo]
            }
            catch let error {
                fetchRequestError = error
            }
        }
        
        guard let photos = mainQueuePhotos else {
            throw fetchRequestError!
        }
        
        return photos
    }
}