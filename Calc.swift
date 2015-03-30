//
//  Calc.swift
//  CycleCredits
//
//  Created by Patrick Murphy on 28/03/2015.
//  Copyright (c) 2015 Patrick Murphy. All rights reserved.
//

import Foundation

// calcuate co2 emissions based on band and distance
func calcCo2Emission(routeDistance: Double, carCo2Emissions: Double) -> Double {
    var calculatedCo2Emissions = 0.0
    var kgCo2Emissions = 0.0
    calculatedCo2Emissions = routeDistance * carCo2Emissions //grammes co2
    kgCo2Emissions = calculatedCo2Emissions / 1000 // kg co2
    
    return kgCo2Emissions
}

// assign an emission value depending on band chosen
func emissionForBand(band:String) -> Double? {
    switch band {
    case "A1":
        return 40
    case "A2":
        return 90
    case "A3":
        return 100
    case "A4":
        return 115
    case "B1":
        return 125
    case "B2":
        return 135
    case "C":
        return 148
    case "D":
        return 163
    case "E":
        return 180
    case "F":
        return 223
    case "G":
        return 230
    default:
        return 0.0
    }
}