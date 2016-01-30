//
//  Averages.swift
//  Near Care
//
//  Created by Niranjan Ravichandran on 30/01/16.
//  Copyright © 2016 adavers. All rights reserved.
//

import Foundation

struct Averages {
    let avgRateOfMortality: Double?
    let avgRateOfComplications: Double?
    let avgPatientExp: Double?
    let avgMedicareCoverage: Double?
    
    init(jsonResponse: NSDictionary) {
        self.avgRateOfMortality = jsonResponse["avg_mortality"] as? Double
        self.avgRateOfComplications = jsonResponse["avg_complication"] as? Double
        self.avgPatientExp = jsonResponse["avg_experience"] as? Double
        self.avgMedicareCoverage = jsonResponse["avg_coverage"] as? Double
    }
    
}