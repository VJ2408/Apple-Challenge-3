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
    let videoName: String
    
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
    Exercise(symbolName: "figure.mind.and.body", name: "Meditating", intensity: "Easy", time: "5 mins", instructions: "Yololol", image: Image("placeholderImage"), videoName: "placeholderName"),
    Exercise(symbolName: "figure.run", name: "Walking", intensity: "Easy", time: "10 mins", instructions: "Yololol", image: Image("placeholderImage"), videoName: "placeholderName"),
    Exercise(symbolName: "figure.walk", name: "Stretches", intensity: "Easy", time: "3 mins", instructions: "Yololol", image: Image("placeholderImage"), videoName: "placeholderName"),
]

let morningMid = [
    Exercise(symbolName: "figure.mind.and.body", name: "Bridge", intensity: "Medium", time: "2 mins", instructions: "Yololol", image: Image("placeholderImage"), videoName: "placeholderName"),
    Exercise(symbolName: "figure.run", name: "Jogging", intensity: "Medium", time: "3 min", instructions: "Yololol", image: Image("placeholderImage"), videoName: "placeholderName"),
    Exercise(symbolName: "figure.walk", name: "Skipping", intensity: "Medium", time: "3 min", instructions: "Yololol", image: Image("placeholderImage"), videoName: "placeholderName"),
]

let morningHard = [
    Exercise(symbolName: "figure.mind.and.body", name: "Lunges", intensity: "Hard", time: "3 min", instructions: "Move your body into a deep lunge by taking a big step forward with your right leg while keeping the left leg outstretched towards the back. Keep your feet flat against the ground as you progress deeper into the pose. Place both hands on the ground next to your right foot. Release your right arm from the ground and turn your torso to face your leg. Keep your right arm extended up towards the ceiling. Return your right arm to the starting position and open up again. Repeat 8 times on each side. This morning exercise is a great quad stretch.", image: Image("placeholderImage"), videoName: "placeholderName"),
    Exercise(symbolName: "figure.mind.and.body", name: "Sit-ups", intensity: "Hard", time: "3 min", instructions: "Yololol", image: Image("placeholderImage"), videoName: "placeholderName"),
    Exercise(symbolName: "figure.mind.and.body", name: "Plank", intensity: "Hard", time: "2 mins", instructions: "Yololol", image: Image("placeholderImage"), videoName: "placeholderName"),
]

let nightEz = [
    Exercise(symbolName: "figure.mind.and.body", name: "Meditating", intensity: "Easy", time: "5 mins", instructions: "Yololol", image: Image("placeholderImage"), videoName: "placeholderName"),
    Exercise(symbolName: "figure.run", name: "Walking", intensity: "Easy", time: "10 mins", instructions: "Yololol", image: Image("placeholderImage"), videoName: "placeholderName"),
    Exercise(symbolName: "figure.walk", name: "Stretches", intensity: "Easy", time: "3 mins", instructions: "Yololol", image: Image("placeholderImage"), videoName: "placeholderName"),
]

let nightMid = [
    Exercise(symbolName: "figure.mind.and.body", name: "Bridge", intensity: "Medium", time: "2 mins", instructions: "1. Lie on your back with knees bent and feet flat on the ground, hip-width apart. \n 2. Place arms by your sides, palms facing down.\n 3. Push through your heels to lift your hips toward the ceiling, forming a straight line from shoulders to knees. \n4. Squeeze your glutes at the top, then lower slowly.", image: Image("placeholderImage"), videoName: "placeholderName"),
    Exercise(symbolName: "figure.run", name: "Jogging", intensity: "Medium", time: "3 min", instructions: "Yololol", image: Image("placeholderImage"), videoName: "placeholderName"),
    Exercise(symbolName: "figure.walk", name: "Skipping", intensity: "Medium", time: "3 min", instructions: "Yololol", image: Image("placeholderImage"), videoName: "placeholderName"),
]

let nightHard = [
    Exercise(symbolName: "figure.mind.and.body", name: "Lunges", intensity: "Hard", time: "3 min", instructions: "1. Lie on your back with knees bent and feet flat on the floor. \n 2. Place your hands behind your head or cross them over your chest.\n 3. Engage your core and lift your upper body toward your knees. \n 4. Lower yourself back down with control. \n 5. Repeat for the desired number of reps.", image: Image("placeholderImage"), videoName: "placeholderName"),
    Exercise(symbolName: "figure.mind.and.body", name: "Sit-ups", intensity: "Hard", time: "3 min", instructions: "1. Lie on your back with knees bent and feet flat on the floor. \n 2. Place your hands behind your head or cross them over your chest.\n 3. Engage your core and lift your upper body toward your knees. \n 4. Lower yourself back down with control. \n 5. Repeat for the desired number of reps.", image: Image("placeholderImage"), videoName: "placeholderName"),
    Exercise(symbolName: "figure.mind.and.body", name: "Plank", intensity: "Hard", time: "2 mins", instructions: "1. Lie face down with forearms on the ground, elbows directly under shoulders, and toes tucked under. \n 2. Push up into a straight line from head to heels, engaging your core.\n 3. Keep your back flat, neck neutral, and avoid letting your hips sag or rise.\n 4. Hold the position for as long as possible while maintaining good form", image: Image("placeholderImage"), videoName: "placeholderName"),
]


let MorningExercises = [ morningEz, morningMid, morningHard ]
let EveningExercises = [ nightEz, nightMid, nightHard ]
