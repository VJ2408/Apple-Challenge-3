// ExerciseSelectionView.swift
// Apple Challenge 3
// Created by Vijai Adithya on 13/11/24.

import SwiftUI

struct ExerciseSelectionView: View {
    
    @State private var searchText = ""
    
    let exercisedefault: [Exercise] = [
        Exercise(symbol: "figure.mind.and.body", name: "Yoga", intensity: "Easy", time: "3 min",instructions: "yayayay")
    ]
    
    var greeting: String {Time.shared.greeting }
    var timeOfDay: String {Time.shared.timeOfDay }
    var exercisesForTimeOfDay:[[Exercise]] {Time.shared.exercisesForTimeOfDay}
    
    var filteredExercises: [Exercise] {
        exercisesForTimeOfDay.flatMap{$0}
            .filter {exercise in
                searchText.isEmpty || exercise.name.lowercased().contains(searchText.lowercased())
            }
    }
    
    var groupedExercises: [(intensity:String, exercises:[Exercise])] {
        [
            ("Easy", filteredExercises.filter { $0.intensity == "Easy" }),
            ("Medium", filteredExercises.filter { $0.intensity == "Medium" }),
            ("Hard", filteredExercises.filter { $0.intensity == "Hard" })
        ]
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    Text(greeting)
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .padding()
                    
                    TextField("Search Activities", text: $searchText)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding([.leading, .trailing], 16)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        
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
                        
                        
                        
                        
                        Text("\(timeOfDay) Activities")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(Color.gray.opacity(0.7))
                            .padding([.leading, .trailing], 16)
                            .padding(.top, 16)
                        
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
                                
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 16) {
                                        ForEach(group.exercises) { exercise in
                                            NavigationLink(destination: ActivitiesView(exercise: exercise)) {
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
                                    }
                                    .padding([.leading, .trailing], 16)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}


#Preview {
    ExerciseSelectionView()
}