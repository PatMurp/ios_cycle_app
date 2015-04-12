//
//  TotalsViewController.swift
//  CycleCredits
//
//  Created by Patrick Murphy on 02/03/2015.
//  Copyright (c) 2015 Patrick Murphy. All rights reserved.
//

import UIKit

class TotalsViewController: UIViewController {
    
    
    @IBOutlet weak var tdistance: UITextField!
    @IBOutlet weak var tco2Savings: UITextField!
    @IBOutlet weak var tValue: UITextField!
    @IBOutlet weak var ccValueSlider: UISlider!
    @IBOutlet weak var ccValue: UILabel!
    
   
    
    @IBAction func sliderValueChanged(sender: UISlider) {
        
        var currentValue = sender.value
        ccValue.text = "\(currentValue)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

