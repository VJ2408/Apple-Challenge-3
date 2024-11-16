//
//  ContentView.swift
//  Apple Challenge 3
//
//  Created by Vijai Adithya on 2/9/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var defaultExercise: Exercise = Exercise(symbolName: "questionmark", name: "You haven't set a default exercise yet!", intensity: "", time: "Tap on an exercise to set it as default!", instructions: "", image: Image("placeholderImage"), videoName: "placeholderName")
    
    var body: some View {
            NavigationStack {
                ExerciseSelectionView(exercise: Exercise(symbolName: "figure.mind.and.body", name: "Default excercise", intensity: "Easy", time: "- min", instructions: "This is a default excercise.", image: Image("placeholderImage"),videoName: "placeholderName"), defaultExercise: $defaultExercise)
            }
        }
    }

#Preview {
    ContentView()
}
