//
//  exercise.swift
//  Apple Challenge 3
//
//  Created by Vijai Adithya on 12/11/24.
//

import SwiftUI

struct Exercise: Identifiable {
    let id = UUID()
    let symbol: String
    let name: String
    let intensity: String
    let time: String

    var image: Image {
        Image(systemName: symbol)
    }

    var symbolColor: Color {
        switch intensity {
        case "Easy":
            return .green
        case "Medium":
            return .yellow
        case "Hard":
            return .red
        default:
            return .gray
        }
    }
}




let exerciseYoga = [
    Exercise(symbol: "figure.mind.and.body", name: "Yoga", intensity: "Easy", time: "3 min"),
    Exercise(symbol: "figure.mind.and.body", name: "Running", intensity: "Easy", time: " 3 min"),
    Exercise(symbol: "figure.mind.and.body", name: "Walking", intensity: "Easy", time: "3 min"),
]

let exerciserun = [
    Exercise(symbol: "figure.mind.and.body", name: "Yoga", intensity: "Medium", time: "3 min"),
    Exercise(symbol: "figure.mind.and.body", name: "Running", intensity: "Medium", time: "3 min"),
    Exercise(symbol: "figure.mind.and.body", name: "Walking", intensity: "Medium", time: "3 min"),
]

let exercisewalk = [
    Exercise(symbol: "figure.mind.and.body", name: "Yoga", intensity: "Hard", time: "3 min"),
    Exercise(symbol: "figure.mind.and.body", name: "Running", intensity: "Hard", time: "3 min"),
    Exercise(symbol: "figure.mind.and.body", name: "Walking", intensity: "Hard", time: "3 min"),
]

