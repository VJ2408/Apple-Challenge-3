//
//  ContentView.swift
//  Apple Challenge 3
//
//  Created by Vijai Adithya on 2/9/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var defaultExercise: Exercise = Exercise(
        name: "You haven't set a default exercise yet!",
        intensity: "",
        time: "Tap on an exercise to set it as default!",
        instructions: "",
        image: Image(systemName: "questionmark.circle"),
        videoName: "placeholderName",
        url: URL(string: "https://example.com")!
    )
    
    var body: some View {
        NavigationStack {
            ExerciseSelection(
                exercise: Exercise(
                    name: "Default exercise",
                    intensity: "Medium",
                    time: "- min",
                    instructions: "This is a default exercise.",
                    image: Image(systemName: "figure.walk"),
                    videoName: "placeholderName",
                    url: URL(string: "https://example.com")!
                ),
                defaultExercise: $defaultExercise
            )
            .navigationTitle("Exercise Selector")
        }
    }
}

#Preview {
    ContentView()
}

#Preview {
    ContentView()
}
