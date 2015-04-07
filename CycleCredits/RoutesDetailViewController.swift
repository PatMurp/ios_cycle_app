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
    
    var routeToEdit:Route?
    
    @IBOutlet weak var routeDate: UITextField!
    @IBOutlet weak var routeDistance: UITextField!
    @IBOutlet weak var bandLabel: UILabel!
    
    @IBOutlet weak var deleteButtonCell: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(routeToEdit != nil) {
            self.title = "Edit Route"
            routeDate.text = routeToEdit!.date
            routeDistance.text = String(format: "%0.02f",routeToEdit!.distance)
            co2Band = routeToEdit!.co2band
        }
        else {
            co2Band = "C"
            deleteButtonCell.hidden = true
        }
        bandLabel.text = co2Band
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SaveRouteDetail" {
            if (self.routeToEdit != nil){
                self.routeToEdit?.date = self.routeDate.text
                self.routeToEdit?.distance = stringToDouble(self.routeDistance.text)
                self.routeToEdit?.co2band = co2Band
            }
            else{
                route = Route(date: self.routeDate.text, distance: stringToDouble(self.routeDistance.text), co2band: co2Band)
            }
        }
        if segue.identifier == "PickBand" {
            let co2PickerViewController = segue.destinationViewController as CarPickerViewController
            co2PickerViewController.selectedCarBand = co2Band
        }
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
