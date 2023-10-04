//
//  SchoolView.swift
//  NYCSchools
//
//  Created by Weiqi Zhuang on 10/3/23.
//

import SwiftUI

struct SchoolView: View {
    @ObservedObject var schoolViewModel = SchoolViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Sort by", selection: $schoolViewModel.sortOrder) {
                    ForEach(SortOrder.allCases, id: \.self) { order in
                        Text(order.rawValue).tag(order)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .padding()
                
                List(schoolViewModel.sortedSchools) { school in
                    NavigationLink(destination: SchoolDetailView(schoolDetailViewModel: SchoolDetailViewModel(school: school))) {
                        Text(school.school_name)
                    }
                }
                .navigationTitle("NYC High Schools")
            }
            .task {
                do {
                    try await schoolViewModel.getSchools()
//                    schools = try await SchoolService.shared.fetchSchools()
                } catch {
                    print("Error fetching schools: \(error)")
                }
            }
        }
    }
}

struct SchoolView_Previews: PreviewProvider {
    static var previews: some View {
        SchoolView()
    }
}

