// ExerciseSelectionView.swift
// Apple Challenge 3
// Created by Vijai Adithya on 13/11/24.

import SwiftUI

struct ExerciseSelectionView: View {
    
    @State private var searchText = ""
    
    let exercise: Exercise
    
    @Binding var defaultExercise: Exercise
    
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
                    
                    VStack(alignment: .leading, spacing: 16) {
                        
                        Text("Default activity")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(Color.gray.opacity(0.7))
                            .padding([.leading, .trailing], 16)
                            .padding(.top, 16)
                        
                            VStack {
                                Image(systemName: defaultExercise.symbolName)
                                    .font(.system(size: 60))
                                    .frame(width: 80, height: 80)
                                
                                Text(defaultExercise.name)
                                    .font(.system(size: 16))
                                    .fontWeight(.semibold)
                                
                                HStack {
                                    Text(defaultExercise.intensity)
                                        .font(.system(size: 14))
                                        .foregroundStyle(exercise.symbolColor)
                                    
                                    Text(defaultExercise.time)
                                        .font(.system(size: 14))
                                }
                                .padding(.top, 8)
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color(uiColor: .white))
                            .cornerRadius(8)
                            .shadow(radius: 5)
                            .padding(.horizontal, 16)
                        
                        
                        
                        
                        Text("\(timeOfDay) activities")
                            .font(.title)
                            .fontWeight(.bold)
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
                                            NavigationLink(destination: ActivitiesView(exercise: exercise, defaultExercise: $defaultExercise)) {
                                                VStack {
                                                    exercise.symbol
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
                                                .frame(minWidth: 165, minHeight: 120)
                                                .background(Color(.white))
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
                .navigationTitle("Activities")
                .toolbarBackground(
                    Color(uiColor: .systemGray6),
                    for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
            }
            .background(Color(uiColor: .systemGray6))
        }
        .searchable(text: $searchText)
    }
}


#Preview {
    @Previewable @State var defaultExercise = Exercise(symbolName: "", name: "", intensity: "", time: "", instructions: "", image: Image("placeholderImage"),videoName: "placeholderName")
    ExerciseSelectionView(exercise: Exercise(symbolName: "figure.mind.and.body", name: "Default", intensity: "Medium", time: "3 min", instructions: "Placeholder", image: Image("placeholderImage"),videoName: "placeholderName"), defaultExercise: $defaultExercise)
}
