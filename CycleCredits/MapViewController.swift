//
//  MapViewController.swift
//  CycleCredits
//
//  Created by Patrick Murphy on 13/04/2015.
//  Copyright (c) 2015 Patrick Murphy. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var trackButton: UIButton!
    
    var locationManager: CLLocationManager!
    var totalDistance: Double = 0
    var isUserTracking: Bool = false
    var oldLocation: CLLocation?
    
    
    @IBAction func trackButtonPressed(sender: AnyObject) {
        
        if isUserTracking {
            trackButton.backgroundColor = UIColor.greenColor()
            trackButton.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
            trackButton.setTitle("Track route", forState: .Normal)
            distanceLabel.text = "0.0 km"
            isUserTracking = false
        } else {
            isUserTracking = true
            trackButton.backgroundColor = UIColor.redColor()
            trackButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            trackButton.setTitle("Stop tracking", forState: .Normal)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createLocationManager()
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        mapView.setUserTrackingMode(MKUserTrackingMode.Follow, animated: true)
        
        // set button background and text colors
        trackButton.backgroundColor = UIColor.greenColor()
        trackButton.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // notify if user moves
    func createLocationManager() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.activityType = .Fitness
    }
    
    func updateDistanceLabel() {
        distanceLabel.text = NSString(format: "%.2f km", totalDistance/1000)
    }
    
    // location tracking
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        if let firstLocation = locations.first as? CLLocation
        {
            mapView.setCenterCoordinate(firstLocation.coordinate, animated: true)
            
            let region = MKCoordinateRegionMakeWithDistance(firstLocation.coordinate, 1000, 1000)
            mapView.setRegion(region, animated: true)
            
            if isUserTracking
            {
                if let oldLocation = oldLocation
                {
                    let delta: CLLocationDistance = firstLocation.distanceFromLocation(oldLocation)
                    totalDistance += delta
                    updateDistanceLabel()
                }
            }
            
            oldLocation = firstLocation
        }
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
