//
//  RoutesViewController.swift
//  CycleCredits
//
//  Created by Patrick Murphy on 02/03/2015.
//  Copyright (c) 2015 Patrick Murphy. All rights reserved.
//

import UIKit

class RoutesViewController: UITableViewController {
    
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
        
        let cell = tableView.dequeueReusableCellWithIdentifier("RouteCell", forIndexPath: indexPath) as RouteCell
        
        // Configure the cell...
        let route = routes[indexPath.row] as Route
        
        cell.dateLabel.text = route.date
        cell.distanceLabel.text = String(format: "%0.02f km", route.distance)
        // calculate saved co2 emissions of route
        cell.emissionLabel.text = String(format: "%0.03f kg Co2", calcCo2Emission(route.distance, emissionForBand(route.co2band)!))
        
        return cell
    }
    
    @IBAction func cancelToRoutesViewController(segue:UIStoryboardSegue) {
    }
    @IBAction func saveRouteDetail(segue:UIStoryboardSegue) {
        
        let routeDetailsViewController = segue.sourceViewController as RoutesDetailViewController
        
        if let routeToEdit = routeDetailsViewController.routeToEdit {
            // get index of routeToEdit
            let routeEditIndex = find(routes, routeToEdit)!
            
            // get indexPath of routeToEdit in tableView
            let indexPath = NSIndexPath(forRow: routeEditIndex, inSection: 0)
            
            // reload that individual row
            tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        } else {
            // add new route to routes array
            routes.append(routeDetailsViewController.route)
            
            // update the tableView
            let indexPath = NSIndexPath(forRow: routes.count-1, inSection: 0)
            tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
        // hide the detail
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            routes.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }


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

    
    // prepare for editing route
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "EditRoute" {
            let navigationController = segue.destinationViewController as UINavigationController
            let routeDetailsViewController =  navigationController.viewControllers[0] as RoutesDetailViewController
            
            let cell = sender as UITableViewCell
            let indexPath = tableView.indexPathForCell(cell)
            let selectedRouteIndex = indexPath?.row
            
            if let index = selectedRouteIndex {
                let route = routes[index]
                routeDetailsViewController.routeToEdit = route
            }
        }
    }
    
    @IBAction func deleteRoute(segue:UIStoryboardSegue) {
        let routeDetailsViewController = segue.sourceViewController as RoutesDetailViewController
        
        if let routeToEdit = routeDetailsViewController.routeToEdit {
            // get index of routeToEdit in routes array
            let routeToEditIndex = find(routes, routeToEdit)!
            
            // get indexPath of routeToEdit in tableView
            let indexPath = NSIndexPath(forRow: routeToEditIndex, inSection: 0)
            
            // delete route from array
            routes.removeAtIndex(routeToEditIndex)
            
            // delete individual row
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation:UITableViewRowAnimation.Fade)
        }
        // hide the detail view controller
        dismissViewControllerAnimated(true, completion: nil)
    }


}
