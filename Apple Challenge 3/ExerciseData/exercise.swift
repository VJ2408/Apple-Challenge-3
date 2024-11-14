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
    let instructions : String
    
    
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



//data for morning, afternoon, night. categorised by difficulty
let morningEz = [
    Exercise(symbol: "figure.mind.and.body", name: "Yoga", intensity: "Easy", time: "3 min", instructions: "Yololol"),
    Exercise(symbol: "figure.mind.and.body", name: "Running", intensity: "Easy", time: " 3 min", instructions: "Yololol"),
    Exercise(symbol: "figure.mind.and.body", name: "Walking", intensity: "Easy", time: "3 min", instructions: "Yololol"),
]

let morningMid = [
    Exercise(symbol: "figure.mind.and.body", name: "Yoga", intensity: "Medium", time: "3 min", instructions: "Yololol"),
    Exercise(symbol: "figure.run", name: "Running", intensity: "Medium", time: "3 min", instructions: "Yololol"),
    Exercise(symbol: "figure.walk", name: "Walking", intensity: "Medium", time: "3 min", instructions: "Yololol"),
]

let morningHard = [
    Exercise(symbol: "figure.mind.and.body", name: "Yoga", intensity: "Hard", time: "3 min", instructions: "Yololol"),
    Exercise(symbol: "figure.mind.and.body", name: "Running", intensity: "Hard", time: "3 min", instructions: "Yololol"),
    Exercise(symbol: "figure.mind.and.body", name: "Walking", intensity: "Hard", time: "3 min", instructions: "Yololol"),
]

let afternoonEz = [
    Exercise(symbol: "figure.mind.and.body", name: "Yoga", intensity: "Easy", time: "3 min", instructions: "Yololol"),
    Exercise(symbol: "figure.mind.and.body", name: "Running", intensity: "Easy", time: "3 min", instructions: "Yololol"),
    Exercise(symbol: "figure.mind.and.body", name: "Walking", intensity: "Easy", time: "3 min", instructions: "Yololol"),
]

let afternoonMid = [
    Exercise(symbol: "figure.mind.and.body", name: "Yoga", intensity: "Medium", time: "3 min", instructions: "Yololol"),
    Exercise(symbol: "figure.mind.and.body", name: "Running", intensity: "Medium", time: "3 min", instructions: "Yololol"),
    Exercise(symbol: "figure.mind.and.body", name: "Walking", intensity: "Medium", time: "3 min", instructions: "Yololol"),
]

let afternoonHard = [
    Exercise(symbol: "figure.mind.and.body", name: "Yoga", intensity: "Hard", time: "3 min", instructions: "Yololol"),
    Exercise(symbol: "figure.mind.and.body", name: "Running", intensity: "Hard", time: "3 min", instructions: "Yololol"),
    Exercise(symbol: "figure.mind.and.body", name: "Walking", intensity: "Hard", time: "3 min", instructions: "Yololol")
]

let nightEz = [
    Exercise(symbol: "figure.mind.and.body", name: "Yoga", intensity: "Easy", time: "3 min", instructions: "Yololol"),
    Exercise(symbol: "figure.mind.and.body", name: "Running", intensity: "Easy", time: "3 min", instructions: "Yololol"),
    Exercise(symbol: "figure.mind.and.body", name: "Walking", intensity: "Easy", time: "3 min", instructions: "Yololol")
]

let nightMid = [
    Exercise(symbol: "figure.mind.and.body", name: "Yoga", intensity: "Medium", time: "3 min", instructions: "Yololol"),
    Exercise(symbol: "figure.mind.and.body", name: "Running", intensity: "Medium", time: "3 min", instructions: "Yololol"),
    Exercise(symbol: "figure.mind.and.body", name: "Walking", intensity: "Medium", time: "3 min", instructions: "Yololol")
]

let nightHard = [
    Exercise(symbol: "figure.mind.and.body", name: "Walk", intensity: "Hard", time: "3 min", instructions: "Yololol"),
    Exercise(symbol: "figure.mind.and.body", name: "Running", intensity: "Hard", time: "3 min", instructions: "Yololol"),
    Exercise(symbol: "figure.mind.and.body", name: "Walking", intensity: "Hard", time: "3 min", instructions: "Yololol")
]


let MorningExercises = [ morningEz, morningMid, morningHard ]
let AfternoonExercises = [ afternoonEz, afternoonMid, afternoonHard ]
let EveningExercises = [ nightEz, nightMid, nightHard ]
