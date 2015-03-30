//
//  RoutesViewController.swift
//  CycleCredits
//
//  Created by Patrick Murphy on 02/03/2015.
//  Copyright (c) 2015 Patrick Murphy. All rights reserved.
//

import UIKit

class RoutesViewController: UITableViewController {
    
    @IBAction func cancelToRoutesViewController(segue:UIStoryboardSegue) {
    }
    @IBAction func saveRouteDetail(segue:UIStoryboardSegue) {
    }
    
    // Load hardcoaded data
    var routes: [Route] = routesData

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return routes.count
    }

    
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        
//        let cell = tableView.dequeueReusableCellWithIdentifier("RouteCell", forIndexPath: indexPath) as UITableViewCell
//
//        // Configure the cell...
//        let route = routes[indexPath.row] as Route
//        
//        
//        cell.textLabel?.text = route.date
//        // create a string value from double
//        
//        cell.detailTextLabel?.text = String(format: "%0.02f km", route.distance)
//
//        return cell
//    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("RouteCell", forIndexPath: indexPath) as UITableViewCell
        
        // Configure the cell...
        let route = routes[indexPath.row] as Route
        
        
//        cell.textLabel?.text = route.date
//        // create a string value from double
//        
//        cell.detailTextLabel?.text = String(format: "%0.02f km", route.distance)
        
        if let dateLabel = cell.viewWithTag(100) as? UILabel {
            dateLabel.text = route.date
        }
        
        if let distLabel = cell.viewWithTag(101) as? UILabel {
            distLabel.text = String(format: "%0.02f km", route.distance)
        }
        
        if let co2Label = cell.viewWithTag(102) as? UILabel {
            co2Label.text = String(format: "%0.03f kg", calcCo2Emission(route.distance, emissionForBand(route.co2band)!))
        }
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
