//
//  SchoolViewModel.swift
//  NYCSchools
//
//  Created by Weiqi Zhuang on 10/3/23.
//

import Foundation

@MainActor
final class SchoolViewModel: ObservableObject {
    @Published var schools: [School] = []
    @Published var sortOrder: SortOrder = .ascending
    
    var sortedSchools: [School] {
        switch sortOrder {
        case .ascending:
            return schools.sorted { $0.school_name < $1.school_name }
        case .descending:
            return schools.sorted { $0.school_name > $1.school_name }
        case .defaultOrder:
            return schools
        }
    }
    
    func getSchools() async throws {
        schools = try await SchoolService.shared.fetchSchools()
    }
}
