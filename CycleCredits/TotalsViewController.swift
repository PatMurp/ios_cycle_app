//
//  TotalsViewController.swift
//  CycleCredits
//
//  Created by Patrick Murphy on 02/03/2015.
//  Copyright (c) 2015 Patrick Murphy. All rights reserved.
//

import UIKit

class TotalsViewController: UIViewController {
    
    var routes: [Route] = routesData
    
    
    
    var valueCc: Double = 7
    var totalDistance = 0.0
    var totalCo2Savings = 0.0
    
    @IBOutlet weak var tdistance: UITextField!
    @IBOutlet weak var tco2Savings: UITextField!
    @IBOutlet weak var tValue: UITextField!
    @IBOutlet weak var ccValueSlider: UISlider!
    @IBOutlet weak var ccValue: UILabel!
    
    // set carbon credit value and recalculate total value when slider is moved
    @IBAction func sliderValueChanged(sender: UISlider) {
        
        var currentValue = lroundf(sender.value) // whole numbers only
        ccValue.text = "\(currentValue)/tonne"
        tValue.text = String(format: "€%0.02f", calcCo2Value(self.sumCo2Savings(), Double(currentValue)))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tdistance.text = String(format: "%0.02f km", self.sumDistance()) // set total distance
        tco2Savings.text = String(format: "%0.03f kg", self.sumCo2Savings())
        tValue.text = String(format: "€%0.02f", calcCo2Value(self.sumCo2Savings(), valueCc))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // calculate total distance
    func sumDistance() -> Double {
        
        for route in routes{
            var r = route as Route
            totalDistance += r.distance
        }
        return totalDistance
    }
    
    // calculate total co2 savings
    func sumCo2Savings() -> Double {
        
        for route in routes {
            var r = route as Route
            totalCo2Savings += (r.distance * emissionForBand(r.co2band)!) / 1000
        }
        return totalCo2Savings
    }
}

