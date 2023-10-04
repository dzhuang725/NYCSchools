//
//  School.swift
//  NYCSchools
//
//  Created by Weiqi Zhuang on 10/3/23.
//
import Foundation

struct School: Codable, Identifiable {
    let dbn: String
    // Given more time I would prefer to use camelCase and CodingKeys to map snake_case in JSON
    let school_name: String
    
    var id: String { dbn }
}
