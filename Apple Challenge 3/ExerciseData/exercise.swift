//
//  exercise.swift
//  Apple Challenge 3
//
//  Created by Vijai Adithya on 12/11/24.
//

import SwiftUI

struct Exercise: Identifiable {
    let id = UUID()
    //let symbolName: String
    let name: String
    let intensity: String
    let time: String
    let instructions : String
    var image: Image
    let videoName: String
    
//    var symbol: Image {
//        Image(systemName: symbolName)
//    }
//    
    var intensitycolor: Color {
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
    Exercise( name: "Meditating", intensity: "Easy", time: "5 mins", instructions: "Yololol", image: Image(.yoga), videoName: "placeholderName"),
    Exercise( name: "Walking", intensity: "Easy", time: "10 mins", instructions: "Yololol", image: Image(.walk), videoName: "placeholderName"),
    Exercise(name: "Stretches", intensity: "Easy", time: "3 mins", instructions: "Yololol", image: Image(.stretching), videoName: "placeholderName"),
]

let morningMid = [
    Exercise( name: "Bridge", intensity: "Medium", time: "2 mins", instructions: "Yololol", image: Image(.bridges), videoName: "placeholderName"),
    Exercise( name: "Jogging", intensity: "Medium", time: "3 min", instructions: "Yololol", image: Image(.running), videoName: "placeholderName"),
    Exercise( name: "Skipping", intensity: "Medium", time: "3 min", instructions: "Yololol", image: Image(.walk), videoName: "placeholderName"),
]

let morningHard = [
    Exercise( name: "Lunges", intensity: "Hard", time: "3 min", instructions: "Move your body into a deep lunge by taking a big step forward with your right leg while keeping the left leg outstretched towards the back. Keep your feet flat against the ground as you progress deeper into the pose. Place both hands on the ground next to your right foot. Release your right arm from the ground and turn your torso to face your leg. Keep your right arm extended up towards the ceiling. Return your right arm to the starting position and open up again. Repeat 8 times on each side. This morning exercise is a great quad stretch.", image: Image(.lunges), videoName: "placeholderName"),
    Exercise( name: "Bridges", intensity: "Hard", time: "5 min", instructions: "Yololol", image: Image(.bridges), videoName: "placeholderName"),
    Exercise(name: "Skipping", intensity: "Hard", time: "5 mins", instructions: "Yololol", image: Image(.skipping), videoName: "placeholderName"),
]

let nightEz = [
    Exercise( name: "Meditating", intensity: "Easy", time: "5 mins", instructions: "Yololol", image: Image(.yoga), videoName: "placeholderName"),
    Exercise( name: "Walking", intensity: "Easy", time: "10 mins", instructions: "Yololol", image: Image(.walk), videoName: "placeholderName"),
    Exercise(name: "Stretches", intensity: "Easy", time: "3 mins", instructions: "Yololol", image: Image(.stretching), videoName: "placeholderName"),
]

let nightMid = [
    Exercise( name: "Bridge", intensity: "Medium", time: "2 mins", instructions: "Yololol", image: Image(.bridges), videoName: "placeholderName"),
    Exercise( name: "Jogging", intensity: "Medium", time: "3 min", instructions: "Yololol", image: Image(.running), videoName: "placeholderName"),
    Exercise( name: "Skipping", intensity: "Medium", time: "3 min", instructions: "Yololol", image: Image(.walk), videoName: "placeholderName"),
]

let nightHard = [
    Exercise( name: "Lunges", intensity: "Hard", time: "3 min", instructions: "Move your body into a deep lunge by taking a big step forward with your right leg while keeping the left leg outstretched towards the back. Keep your feet flat against the ground as you progress deeper into the pose. Place both hands on the ground next to your right foot. Release your right arm from the ground and turn your torso to face your leg. Keep your right arm extended up towards the ceiling. Return your right arm to the starting position and open up again. Repeat 8 times on each side. This morning exercise is a great quad stretch.", image: Image(.lunges), videoName: "placeholderName"),
    Exercise( name: "Bridges", intensity: "Hard", time: "5 min", instructions: "Yololol", image: Image(.bridges), videoName: "placeholderName"),
    Exercise(name: "Skipping", intensity: "Hard", time: "5 mins", instructions: "Yololol", image: Image(.skipping), videoName: "placeholderName"),
]


let MorningExercises = [ morningEz, morningMid, morningHard ]
let EveningExercises = [ nightEz, nightMid, nightHard ]
