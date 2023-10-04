//
//  SchoolDetailViewModel.swift
//  NYCSchools
//
//  Created by Weiqi Zhuang on 10/3/23.
//

import Foundation

final class SchoolDetailViewModel: ObservableObject {
    let school: School
    @Published var satScore: SATScore?

    init(school: School) {
        self.school = school
    }
    
    func getSATScore() async throws {
        satScore = try await SchoolService.shared.fetchSATScores(for: school.dbn)
    }
    
    func getSchoolName() -> String {
        return school.school_name
    }
}
