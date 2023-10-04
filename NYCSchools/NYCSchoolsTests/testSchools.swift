//
//  testSchools.swift
//  NYCSchoolsTests
//
//  Created by Weiqi Zhuang on 10/3/23.
//

@testable import NYCSchools

let testSchools: [School] = [
    School(dbn: "1", school_name: "Yankee High School"),
    School(dbn: "2", school_name: "Alpha High School"),
    School(dbn: "3", school_name: "Hotel High School")
]

let largeTestSchools: [School] = Array(repeating: testSchools, count: 1000).flatMap { $0 }

