//
//  Apple_Challenge_3App.swift
//  Apple Challenge 3
//
//  Created by Vijai Adithya on 2/9/24.
//

import SwiftUI

@main
struct Apple_Challenge_3App: App {
    var body: some Scene {
        WindowGroup {
            ExerciseSelectionView(exercise: Exercise(symbolName: "figure.mind.and.body", name: "Default excercise", intensity: "Easy", time: "- min", instructions: "This is a default excercise.", image: Image("placeholderImage")))
        }
    }
}
