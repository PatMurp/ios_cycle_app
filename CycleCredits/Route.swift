//
//  Route.swift
//  CycleCredits
//
//  Created by Patrick Murphy on 02/03/2015.
//  Copyright (c) 2015 Patrick Murphy. All rights reserved.
//

// Simple Route object to test app with hardcoded data
import UIKit

class Route: NSObject {
    var date : String
    var distance: Double
    var co2band: String
    
    init(date: String, distance: Double, co2band: String) {
        self.date = date
        self.distance = distance
        self.co2band = co2band
    }
}