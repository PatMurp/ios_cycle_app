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
    
    init(date: String, distance: Double) {
        self.date = date
        self.distance = distance
    }
}