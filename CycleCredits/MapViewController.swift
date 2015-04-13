//
//  MapViewController.swift
//  CycleCredits
//
//  Created by Patrick Murphy on 13/04/2015.
//  Copyright (c) 2015 Patrick Murphy. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // wit cordinates
        var latitude:CLLocationDegrees = 52.245748
        var longitude:CLLocationDegrees = -7.138378
        
        // zoom
        var latDelta:CLLocationDegrees = 0.01
        var lonDelta:CLLocationDegrees = 0.01
        
        // zooom area
        var theSpan:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        // location
        var bikeStand:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        // region display
        var theRegion:MKCoordinateRegion = MKCoordinateRegionMake(bikeStand, theSpan)
        
        // display map
        self.mapView.setRegion(theRegion, animated: true)
        
        // pin
        var bikeStandLocation = MKPointAnnotation()
        
        // pin cordinates
        bikeStandLocation.coordinate = bikeStand
        
        // title
        bikeStandLocation.title = "WIT Bike Stand"
        
        // subtitle
        bikeStandLocation.subtitle = "Journey starts here"
        
        // display info and pin
        self.mapView.addAnnotation(bikeStandLocation)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
