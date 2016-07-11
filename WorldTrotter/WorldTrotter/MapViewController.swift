//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Cox, Christian on 5/9/16.
//  Copyright © 2016 Cox, Christian. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    // MARK: Declarations
    var mapView: MKMapView!
    
    // MARK: View Life Cycle Stuff
    override func loadView() {
        // Create a map view
        mapView = MKMapView()
        
        // Set it as *the* view of this view controller
        view = mapView
        
        // Create segmented control and add to view
        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        segmentedControl.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(MapViewController.mapTypeChanged(_:)), forControlEvents: .ValueChanged)
        //This is a weird legacy thing that is req'd
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        // Create constraints for segmented control
        // Make sure to use guides
        // topLayoutGuide makes sure you're not underlapping status bar
        // layoutMarginsGuide should be self explanatory, helpful in that it adjust for varying screen sizes
        let topConstraint = segmentedControl.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor)
        let margins = view.layoutMarginsGuide
        let leadingConstraint = segmentedControl.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor)
        // Set these contraints as active, which finds the common ancestor and calls add/remove constraint method
        // This is preferable to calling addConstraint(_:) / removeConstraint(_:) yourself
        topConstraint.active = true
        leadingConstraint.active = true
        trailingConstraint.active = true
    }
    
    override func viewDidLoad() {
        // When this method is called, all outlets etc have been loaded.
        // Use this when your custom code only needs to be done once during the run of the app.
        
        // Always call the super implementation of viewDidLoad
        super.viewDidLoad()
        
        print("MapViewController loaded its view.")
    }
    
    override func viewWillAppear(animated: Bool) {
        // When this method is called, all outlets etc have NOT been loaded.
        // Use this when your custom code needs to be done each time the view controller's view appears on screen.
        
        // Always call the super implementation of viewDidLoad
        super.viewDidLoad()
    }
    
    // MARK: Misc funcs
    func mapTypeChanged(segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .Standard
        case 1:
            mapView.mapType = .Hybrid
        case 2:
            mapView.mapType = .Satellite
        default:
            break
        }
    }
}
