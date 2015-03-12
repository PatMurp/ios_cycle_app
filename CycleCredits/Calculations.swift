//
//  Calculations.swift
//  CycleCredits
//
//  Created by Patrick Murphy on 03/03/2015.
//  Copyright (c) 2015 Patrick Murphy. All rights reserved.
//

import Foundation

func roundToTwoDecimalsPlaces(value: Double) -> Double {
    let numberOfPlaces = 2.0
    let multiplier = pow(10.0, numberOfPlaces)
    let rounded = round(value * multiplier) / multiplier
    
    return rounded
}