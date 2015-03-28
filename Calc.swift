//
//  Calc.swift
//  CycleCredits
//
//  Created by Patrick Murphy on 28/03/2015.
//  Copyright (c) 2015 Patrick Murphy. All rights reserved.
//

import Foundation

func calcCo2Emission(routeDistance: Double, carCo2Emissions: Double) -> Double {
    var calculatedCo2Emissions = 0.0
    var kgCo2Emissions = 0.0
    calculatedCo2Emissions = routeDistance * carCo2Emissions //grammes co2
    kgCo2Emissions = calculatedCo2Emissions / 1000 // kg co2
    
    return kgCo2Emissions
    
}