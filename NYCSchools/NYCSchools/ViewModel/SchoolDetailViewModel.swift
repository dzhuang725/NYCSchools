//
//  SchoolDetailViewModel.swift
//  NYCSchools
//
//  Created by Weiqi Zhuang on 10/3/23.
//

import Foundation

@MainActor
final class SchoolDetailViewModel: ObservableObject {
    @Published var school: School
    @Published var satScore: SATScore?
    
    init(school: School) {
        self.school = school
        Task {
            do{
                try await getSATScore()
            } catch {
                print("Error fetching SAT scores: \(error)")
            }
        }
    }
    
    func getSATScore() async throws{
        self.satScore = try await SchoolService.shared.fetchSATScores(for: school.dbn)
    }
    
    func getSchoolName() -> String {
        return school.school_name
    }
}
