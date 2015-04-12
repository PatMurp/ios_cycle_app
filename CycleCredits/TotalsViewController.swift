//
//  TotalsViewController.swift
//  CycleCredits
//
//  Created by Patrick Murphy on 02/03/2015.
//  Copyright (c) 2015 Patrick Murphy. All rights reserved.
//

import UIKit

class TotalsViewController: UIViewController {
    
    var valueCc: Double = 7
    
    @IBOutlet weak var tdistance: UITextField!
    @IBOutlet weak var tco2Savings: UITextField!
    @IBOutlet weak var tValue: UITextField!
    @IBOutlet weak var ccValueSlider: UISlider!
    @IBOutlet weak var ccValue: UILabel!
    
    // temp values for testing only
    var tempDistance = 23.4
    var tempco2Savings = 2.3
   
    // set carbon credit value and total value when slider is moved
    @IBAction func sliderValueChanged(sender: UISlider) {
        
        var currentValue = lroundf(sender.value)
        ccValue.text = "\(currentValue)/tonne"
        tValue.text = String(format: "€%0.02f", calcCo2Value(tempco2Savings, Double(currentValue)))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tdistance.text = String(format: "%0.02f km", tempDistance)
        tco2Savings.text = String(format: "%0.03f kg", tempco2Savings)
        tValue.text = String(format: "€%0.02f", calcCo2Value(tempco2Savings, valueCc))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

