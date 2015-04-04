//
//  RoutesDetailViewController.swift
//  CycleCredits
//
//  Created by Patrick Murphy on 01/04/2015.
//  Copyright (c) 2015 Patrick Murphy. All rights reserved.
//

import UIKit

class RoutesDetailViewController: UITableViewController {
    
    var route:Route!
    var co2Band:String = "C"
    
    @IBOutlet weak var routeDate: UITextField!
    @IBOutlet weak var routeDistance: UITextField!
    @IBOutlet weak var bandLabel: UILabel!
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SaveRouteDetail" {
            var distance = self
            route = Route(date: self.routeDate.text, distance: stringToDouble(self.routeDistance.text), co2band: co2Band)
        }
        
        if segue.identifier == "PickBand" {
            let co2BandPickerViewController = segue.destinationViewController as
            CarPickerViewController
            co2BandPickerViewController.selectedCarBand = co2Band
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bandLabel.text = co2Band

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // tap anywhere and bring up keyboard in first field
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 {
            routeDate.becomeFirstResponder()
        }
    }
    // MARK: - Table view data source
    
    @IBAction func selectedBand(segue:UIStoryboardSegue) {
        let carPickerViewController = segue.sourceViewController as
        CarPickerViewController
        if let selectedCarBand = carPickerViewController.selectedCarBand {
            bandLabel.text = selectedCarBand
            co2Band = selectedCarBand
        }
    }

}