//
//  PhotosViewController.swift
//  Photorama
//
//  Created by Cox, Christian on 5/12/16.
//  Copyright © 2016 Cox, Christian. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController, UICollectionViewDelegate {

    // MARK: Declarations
    @IBOutlet var collectionView: UICollectionView!
    var store: PhotoStore!
    let photoDataSource = PhotoDataSource()
    
    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = photoDataSource
        collectionView.delegate = self
        
        store.fetchInterestingPhotos() { (photosResult) -> Void in
            NSOperationQueue.mainQueue().addOperationWithBlock() {
                switch photosResult {
                case let .Success(photos):
                    print("Successfully found \(photos.count) interesting photos.")
                    self.photoDataSource.photos = photos
                case let .Failure(error):
                    self.photoDataSource.photos.removeAll()
                    print("Error fetching interesting photos: \(error)")
                }
                self.collectionView.reloadSections(NSIndexSet(index: 0))
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowPhoto" {
            if let selectedIndexPath = collectionView.indexPathsForSelectedItems()?.first {
                let photo = photoDataSource.photos[selectedIndexPath.row]
                let destinationVC = segue.destinationViewController as! PhotoInfoViewController
                destinationVC.photo = photo
                destinationVC.store = store
            }
        }
    }
    
    // MARK: Delegation
    func collectionView(collectionView: UICollectionView, willDisplayCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        let photo = photoDataSource.photos[indexPath.row]
        
        // Download the image data, which could take some time
        store.fetchImageForPhoto(photo) { (result) -> Void in
            NSOperationQueue.mainQueue().addOperationWithBlock() {
                // The index path for the photo might have changed between the
                // time the request started and finished, so find the most
                // recent index path
                let photoIndex = self.photoDataSource.photos.indexOf(photo)!
                let photoIndexPath = NSIndexPath(forItem: photoIndex, inSection: 0)
                
                // When the request finishes, only update the cell if it's still visible
                if let cell = self.collectionView.cellForItemAtIndexPath(photoIndexPath) as? PhotoCollectionViewCell {
                    cell.updateWithImage(photo.image)
                }
            }
        }
    }
}
