//
//  exercise.swift
//  Apple Challenge 3
//
//  Created by Vijai Adithya on 12/11/24.
//

import SwiftUI

struct Exercise: Identifiable {
    let id = UUID()
    let symbolName: String
    let name: String
    let intensity: String
    let time: String
    let instructions : String
    var image: Image
    
    var symbol: Image {
        Image(systemName: symbolName)
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
    Exercise(symbolName: "figure.mind.and.body", name: "Yoga", intensity: "Easy", time: "3 min", instructions: "Yololol", image: Image("placeholderImage")),
    Exercise(symbolName: "figure.run", name: "Running", intensity: "Easy", time: " 3 min", instructions: "Yololol", image: Image("placeholderImage")),
    Exercise(symbolName: "figure.walk", name: "Walking", intensity: "Easy", time: "3 min", instructions: "Yololol", image: Image("placeholderImage")),
]

let morningMid = [
    Exercise(symbolName: "figure.mind.and.body", name: "Yoga", intensity: "Medium", time: "3 min", instructions: "Yololol", image: Image("placeholderImage")),
    Exercise(symbolName: "figure.run", name: "Running", intensity: "Medium", time: "3 min", instructions: "Yololol", image: Image("placeholderImage")),
    Exercise(symbolName: "figure.walk", name: "Walking", intensity: "Medium", time: "3 min", instructions: "Yololol", image: Image("placeholderImage")),
]

let morningHard = [
    Exercise(symbolName: "figure.mind.and.body", name: "Lunges", intensity: "Hard", time: "3 min", instructions: "Move your body into a deep lunge by taking a big step forward with your right leg while keeping the left leg outstretched towards the back. Keep your feet flat against the ground as you progress deeper into the pose. Place both hands on the ground next to your right foot. Release your right arm from the ground and turn your torso to face your leg. Keep your right arm extended up towards the ceiling. Return your right arm to the starting position and open up again. Repeat 8 times on each side. This morning exercise is a great quad stretch.", image: Image("placeholderImage")),
    Exercise(symbolName: "figure.mind.and.body", name: "Running", intensity: "Hard", time: "3 min", instructions: "Yololol", image: Image("placeholderImage")),
    Exercise(symbolName: "figure.mind.and.body", name: "Walking", intensity: "Hard", time: "3 min", instructions: "Yololol", image: Image("placeholderImage")),
]

let afternoonEz = [
    Exercise(symbolName: "figure.mind.and.body", name: "Meditate", intensity: "Easy", time: "3 min", instructions: "Yololol", image: Image("placeholderImage")),
    Exercise(symbolName: "figure.mind.and.body", name: "Running", intensity: "Easy", time: "3 min", instructions: "Yololol", image: Image("placeholderImage")),
    Exercise(symbolName: "figure.walk", name: "Walking", intensity: "Easy", time: "3 min", instructions: "Yololol", image: Image("placeholderImage")),
]

let afternoonMid = [
    Exercise(symbolName: "figure.mind.and.body", name: "Yoga", intensity: "Medium", time: "3 min", instructions: "Yololol", image: Image("placeholderImage")),
    Exercise(symbolName: "figure.mind.and.body", name: "Running", intensity: "Medium", time: "3 min", instructions: "Yololol", image: Image("placeholderImage")),
    Exercise(symbolName: "figure.mind.and.body", name: "Walking", intensity: "Medium", time: "3 min", instructions: "Yololol", image: Image("placeholderImage")),
]

let afternoonHard = [
    Exercise(symbolName: "figure.mind.and.body", name: "Yoga", intensity: "Hard", time: "3 min", instructions: "Yololol", image: Image("placeholderImage")),
    Exercise(symbolName: "figure.mind.and.body", name: "Running", intensity: "Hard", time: "3 min", instructions: "Yololol", image: Image("placeholderImage")),
    Exercise(symbolName: "figure.mind.and.body", name: "Walking", intensity: "Hard", time: "3 min", instructions: "Yololol", image: Image("placeholderImage"))
]

let nightEz = [
    Exercise(symbolName: "figure.mind.and.body", name: "Yoga", intensity: "Easy", time: "3 min", instructions: "Yololol", image: Image("placeholderImage")),
    Exercise(symbolName: "figure.mind.and.body", name: "Running", intensity: "Easy", time: "3 min", instructions: "Yololol", image: Image("placeholderImage")),
    Exercise(symbolName: "figure.mind.and.body", name: "Walking", intensity: "Easy", time: "3 min", instructions: "Yololol", image: Image("placeholderImage"))
]

let nightMid = [
    Exercise(symbolName: "figure.mind.and.body", name: "Yoga", intensity: "Medium", time: "3 min", instructions: "Yololol", image: Image("placeholderImage")),
    Exercise(symbolName: "figure.mind.and.body", name: "Running", intensity: "Medium", time: "3 min", instructions: "Yololol", image: Image("placeholderImage")),
    Exercise(symbolName: "figure.mind.and.body", name: "Walking", intensity: "Medium", time: "3 min", instructions: "Yololol", image: Image("placeholderImage"))
]

let nightHard = [
    Exercise(symbolName: "figure.mind.and.body", name: "Walk", intensity: "Hard", time: "3 min", instructions: "Yololol", image: Image("placeholderImage")),
    Exercise(symbolName: "figure.mind.and.body", name: "Running", intensity: "Hard", time: "3 min", instructions: "Yololol", image: Image("placeholderImage")),
    Exercise(symbolName: "figure.mind.and.body", name: "Walking", intensity: "Hard", time: "3 min", instructions: "Yololol", image: Image("placeholderImage"))
]


let MorningExercises = [ morningEz, morningMid, morningHard ]
let AfternoonExercises = [ afternoonEz, afternoonMid, afternoonHard ]
let EveningExercises = [ nightEz, nightMid, nightHard ]
