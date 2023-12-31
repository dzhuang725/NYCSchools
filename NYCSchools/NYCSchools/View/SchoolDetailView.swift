//
//  SchoolDetailView.swift
//  NYCSchools
//
//  Created by Weiqi Zhuang on 10/3/23.
//

import SwiftUI

struct SchoolDetailView: View {
    let schoolDetailViewModel: SchoolDetailViewModel
    
    var body: some View {
        List {
            Section(header: Text("School Name")) {
                Text(schoolDetailViewModel.getSchoolName())
            }
            
            if let score = schoolDetailViewModel.satScore {
                Section(header: Text("SAT Scores")) {
                    Text("Reading: \(score.sat_critical_reading_avg_score)")
                    Text("Math: \(score.sat_math_avg_score)")
                    Text("Writing: \(score.sat_writing_avg_score)")
                }
            } else {
                Text("No SAT scores available")
            }
        }
        .listStyle(GroupedListStyle())
        .navigationTitle("School Details")
    }
}


#Preview {
    SchoolDetailView(schoolDetailViewModel: SchoolDetailViewModel(school: School(dbn: "02M260", school_name: "Clinton School Writers & Artists, M.S. 260")))
}
