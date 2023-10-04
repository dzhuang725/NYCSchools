//
//  SchoolService.swift
//  NYCSchools
//
//  Created by Weiqi Zhuang on 10/3/23.
//

import Foundation

class SchoolService {
    static let shared = SchoolService()
    
    // Given more time I would not hard code urlString.
    func fetchSchools() async throws -> [School] {
        let urlString = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let schools = try JSONDecoder().decode([School].self, from: data)
        return schools
    }
    
    func fetchSATScores(for dbn: String) async throws -> SATScore? {
        let urlString = "https://data.cityofnewyork.us/resource/f9bf-2cp4.json?dbn=\(dbn)"
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let satScores = try JSONDecoder().decode([SATScore].self, from: data)
        return satScores.first
    }

}
