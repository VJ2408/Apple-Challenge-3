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
    Exercise( name: "Meditating", intensity: "Easy", time: "5 mins", instructions: "First, Sit or lie down in a quiet, comfortable place.Then,Close your eyes and take a few deep breaths to relax. Focus on your breathing, a mantra, or an image to clear your mind. If your mind wanders, gently bring your focus back. Meditate for 5–20 minutes, or as desired.", image: Image(.yoga), videoName: "placeholderName"),
    Exercise( name: "Walking", intensity: "Easy", time: "10 mins", instructions: "1. Wear comfortable shoes and clothing.Start with a warm-up by walking slowly for 3–5 minutes. Increase your pace to a brisk but comfortable level. Cool down by walking slowly for 3–5 minutes.", image: Image(.walk), videoName: "placeholderName"),
    Exercise(name: "Stretches", intensity: "Easy", time: "3 mins", instructions: "Sit with one leg extended and reach for your toes.Hold for the time displayed.", image: Image(.stretching), videoName: "placeholderName"),
]

let morningMid = [
    Exercise( name: "Bridge", intensity: "Medium", time: "2 mins", instructions: "Lie on your back with knees bent and feet flat on the ground, hip-width apart. Place arms by your sides, palms facing down. Push through your heels to lift your hips toward the ceiling, forming a straight line from shoulders to knees. Squeeze your glutes at the top, then lower slowly.Repeat for desired reps.", image: Image(.bridges), videoName: "placeholderName"),
    Exercise( name: "Jogging", intensity: "Medium", time: "3 min", instructions: "Wear comfortable shoes and clothing suitable for jogging.Start with a light warm-up by walking briskly for 5 minutes.Begin jogging at a pace where you can still talk without gasping for air. Maintain an upright posture, relaxed shoulders, and rhythmic breathing.Cool down by walking for 5–10 minutes after jogging.", image: Image(.running), videoName: "placeholderName"),
    Exercise( name: "Skipping", intensity: "Medium", time: "3 min", instructions: "Hold the rope handles with both hands, elbows close to your sides.Swing the rope overhead and jump as it passes under your feet.Land softly on the balls of your feet.Establish a rhythm and gradually increase speed or try different techniques (e.g., double unders).Maintain a straight posture and avoid large jumps.", image: Image(.walk), videoName: "placeholderName"),
]

let morningHard = [
    Exercise( name: "Lunges", intensity: "Hard", time: "3 min", instructions: "Move your body into a deep lunge by taking a big step forward with your right leg while keeping the left leg outstretched towards the back. Keep your feet flat against the ground as you progress deeper into the pose. Place both hands on the ground next to your right foot. Release your right arm from the ground and turn your torso to face your leg. Keep your right arm extended up towards the ceiling. Return your right arm to the starting position and open up again. Repeat 8 times on each side. This morning exercise is a great quad stretch.", image: Image(.lunges), videoName: "placeholderName"),
    Exercise( name: "Bridges", intensity: "Hard", time: "5 min", instructions: "Lie on your back with knees bent and feet flat on the ground, hip-width apart. Place arms by your sides, palms facing down. Push through your heels to lift your hips toward the ceiling, forming a straight line from shoulders to knees. Squeeze your glutes at the top, then lower slowly.Repeat for desired reps.", image: Image(.bridges), videoName: "placeholderName"),
    Exercise(name: "Skipping", intensity: "Hard", time: "5 mins", instructions: "Hold the rope handles with both hands, elbows close to your sides.Swing the rope overhead and jump as it passes under your feet.Land softly on the balls of your feet.Establish a rhythm and gradually increase speed or try different techniques (e.g., double unders).Maintain a straight posture and avoid large jumps.", image: Image(.skipping), videoName: "placeholderName"),
]

let nightEz = [
    Exercise( name: "Meditating", intensity: "Easy", time: "5 mins", instructions: "First, Sit or lie down in a quiet, comfortable place.Then,Close your eyes and take a few deep breaths to relax. Focus on your breathing, a mantra, or an image to clear your mind. If your mind wanders, gently bring your focus back. Meditate for 5–20 minutes, or as desired.", image: Image(.yoga), videoName: "placeholderName"),
    Exercise( name: "Walking", intensity: "Easy", time: "10 mins", instructions: "1. Wear comfortable shoes and clothing.Start with a warm-up by walking slowly for 3–5 minutes. Increase your pace to a brisk but comfortable level. Cool down by walking slowly for 3–5 minutes.", image: Image(.walk), videoName: "placeholderName"),
    Exercise(name: "Stretches", intensity: "Easy", time: "3 mins", instructions: "Sit with one leg extended and reach for your toes.Hold for the time displayed.", image: Image(.stretching), videoName: "placeholderName"),
]

let nightMid = [
    Exercise( name: "Bridge", intensity: "Medium", time: "2 mins", instructions: "Lie on your back with knees bent and feet flat on the ground, hip-width apart. Place arms by your sides, palms facing down. Push through your heels to lift your hips toward the ceiling, forming a straight line from shoulders to knees. Squeeze your glutes at the top, then lower slowly.Repeat for desired reps.", image: Image(.bridges), videoName: "placeholderName"),
    Exercise( name: "Jogging", intensity: "Medium", time: "3 min", instructions: "Wear comfortable shoes and clothing suitable for jogging.Start with a light warm-up by walking briskly for 5 minutes.Begin jogging at a pace where you can still talk without gasping for air. Maintain an upright posture, relaxed shoulders, and rhythmic breathing.Cool down by walking for 5–10 minutes after jogging.", image: Image(.running), videoName: "placeholderName"),
    Exercise( name: "Skipping", intensity: "Medium", time: "3 min", instructions: "Hold the rope handles with both hands, elbows close to your sides.Swing the rope overhead and jump as it passes under your feet.Land softly on the balls of your feet.Establish a rhythm and gradually increase speed or try different techniques (e.g., double unders).Maintain a straight posture and avoid large jumps.", image: Image(.walk), videoName: "placeholderName"),
]

let nightHard = [
    Exercise( name: "Lunges", intensity: "Hard", time: "3 min", instructions: "Move your body into a deep lunge by taking a big step forward with your right leg while keeping the left leg outstretched towards the back. Keep your feet flat against the ground as you progress deeper into the pose. Place both hands on the ground next to your right foot. Release your right arm from the ground and turn your torso to face your leg. Keep your right arm extended up towards the ceiling. Return your right arm to the starting position and open up again. Repeat 8 times on each side. This morning exercise is a great quad stretch.", image: Image(.lunges), videoName: "placeholderName"),
    Exercise( name: "Bridges", intensity: "Hard", time: "5 min", instructions: "Lie on your back with knees bent and feet flat on the ground, hip-width apart. Place arms by your sides, palms facing down. Push through your heels to lift your hips toward the ceiling, forming a straight line from shoulders to knees. Squeeze your glutes at the top, then lower slowly.Repeat for desired reps.", image: Image(.bridges), videoName: "placeholderName"),
    Exercise(name: "Skipping", intensity: "Hard", time: "5 mins", instructions: "Hold the rope handles with both hands, elbows close to your sides.Swing the rope overhead and jump as it passes under your feet.Land softly on the balls of your feet.Establish a rhythm and gradually increase speed or try different techniques (e.g., double unders).Maintain a straight posture and avoid large jumps.", image: Image(.skipping), videoName: "placeholderName"),
]



let MorningExercises = [ morningEz, morningMid, morningHard ]
let EveningExercises = [ nightEz, nightMid, nightHard ]
