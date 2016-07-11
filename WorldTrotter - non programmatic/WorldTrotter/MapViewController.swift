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
    @IBOutlet var mapView: MKMapView!
    
    // MARK: View Life Cycle Stuff
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
    
    
    // MARK: IB Funcs
    @IBAction func segControlValueChanged(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
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
