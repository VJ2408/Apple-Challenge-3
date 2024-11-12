//
//  ContentView.swift
//  Apple Challenge 3
//
//  Created by Vijai Adithya on 2/9/24.
//

import SwiftUI

struct ContentView: View {
    let allExercises: [[Exercise]] = [exerciseYoga, exerciserun, exercisewalk]
    
    let exercisedefault: [Exercise] = [
        Exercise(symbol: "figure.mind.and.body", name: "Yoga", intensity: "Easy", time: "3 min")
    ]
    
    // Search bar
    @State private var searchText = ""
    
    // Based on time of day
    var greeting: String {
        let hour = Calendar.current.component(.hour, from: Date())
        switch hour {
        case 0..<12:
            return "Good Morning"
        case 12..<17:
            return "Good Afternoon"
        default:
            return "Good Evening"
        }
    }
    
    // Filtered exercises
    var filteredExercises: [Exercise] {
        if searchText.isEmpty {
            return allExercises.flatMap { $0 }
        } else {
            return allExercises.flatMap { $0 }.filter { exercise in
                exercise.name.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    // Grouping
    var groupedExercises: [(intensity: String, exercises: [Exercise])] {
        [
            ("Easy", allExercises.flatMap { $0 }.filter { $0.intensity == "Easy" }),
            ("Medium", allExercises.flatMap { $0 }.filter { $0.intensity == "Medium" }),
            ("Hard", allExercises.flatMap { $0 }.filter { $0.intensity == "Hard" })
        ]
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                   //good monring/ afternoon/evening
                    Text(greeting)
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .padding()
                    
                    // search bar
                    TextField("Search Activities", text: $searchText)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding([.leading, .trailing], 16)
                    
                    // Default
                    VStack(alignment: .leading, spacing: 16) {
                        // Section header for default
                        Text("Default Activity")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(Color.gray.opacity(0.7))
                            .padding([.leading, .trailing], 16)
                            .padding(.top, 16)
                        
                        Divider()
                            .background(Color.gray)
                            .padding(.bottom, 8)
                        
                
                        ForEach(exercisedefault) { exercise in
                            VStack {
                                Image(systemName: exercise.symbol)
                                    .font(.system(size: 60))
                                    .frame(width: 80, height: 80)
                                
                                Text(exercise.name)
                                    .font(.system(size: 16))
                                    .fontWeight(.semibold)
                                
                                HStack {
                                    Text(exercise.intensity)
                                        .font(.system(size: 14))
                                        .foregroundColor(.secondary)
                                    
                                    Text(exercise.time)
                                        .font(.system(size: 14))
                                        .foregroundColor(.secondary)
                                }
                                .padding(.top, 8)
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                            .shadow(radius: 5)
                            .padding(.horizontal, 16)
                        }
                    }
                    
                    ForEach(groupedExercises, id: \.intensity) { group in
                        VStack(alignment: .leading) {
                            Text(group.intensity)
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundColor(Color.gray.opacity(0.7))
                                .padding([.leading, .trailing], 16)
                                .padding(.top, 16)
                            
                            Divider()
                                .background(Color.gray)
                                .padding(.bottom, 8)
                            
                            //Horizontal scroll
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 16) {
                                    ForEach(group.exercises) { exercise in
                                        VStack {
                                            exercise.image
                                                .foregroundColor(exercise.symbolColor)
                                                .font(.system(size: 60))
                                                
                                            
                                            HStack {
                                                Text(exercise.name)
                                                    .font(.system(size: 14))
                                                    .lineLimit(1)
                                                
                                                Text(" \(exercise.time)")
                                                    .font(.system(size: 14))
                                                    .foregroundColor(.secondary)
                                                    .lineLimit(1)
                                                    .minimumScaleFactor(0.5)
                                            }
                                        }
                                        .padding()
                                        .frame(minHeight: 120)
                                        .background(Color(.systemGray6))
                                        .cornerRadius(8)
                                    }
                                }
                                .padding([.leading, .trailing], 16)
                            }
                        }
                    }
                }
                .navigationTitle("")             }
        }
    }
}

#Preview {
    ContentView()
}
