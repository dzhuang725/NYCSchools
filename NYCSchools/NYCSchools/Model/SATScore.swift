//
//  SATScore.swift
//  NYCSchools
//
//  Created by Weiqi Zhuang on 10/3/23.
//

import Foundation

struct SATScore: Codable, Identifiable {
    let dbn: String
    // Given more time I would prefer to use camelCase and CodingKeys to map snake_case in JSON
    let school_name: String
    let num_of_sat_test_takers: String
    let sat_critical_reading_avg_score: String
    let sat_math_avg_score: String
    let sat_writing_avg_score: String
    
    var id: String { dbn }
}
