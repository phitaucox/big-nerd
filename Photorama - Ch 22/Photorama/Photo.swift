//
//  Photo.swift
//  Photorama
//
//  Created by Cox, Christian on 5/13/16.
//  Copyright © 2016 Cox, Christian. All rights reserved.
//

import UIKit
import CoreData


class Photo: NSManagedObject {

// Insert code here to add functionality to your managed object subclass

    var image: UIImage?
    
    // This method is invoked when objects are added to the DB
    override func awakeFromInsert() {
        super.awakeFromInsert()
        
        // Give the properties their initial values
        title = ""
        photoID = ""
        remoteURL = NSURL()
        photoKey = NSUUID().UUIDString
        dateTaken = NSDate()
    }
    
}
