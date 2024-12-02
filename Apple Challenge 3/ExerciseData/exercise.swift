//
//  exercise.swift
//  Apple Challenge 3
//
//  Created by Vijai Adithya on 12/11/24.
//

import SwiftUI

struct Exercise: Identifiable {
    let id = UUID()
   // let symbolName: String
    let name: String
    let intensity: String
    let time: String
    let instructions : String
    var image: Image
    let videoName: String
    let url: URL
    

    
    
    var IntensityColor: Color {
        switch intensity{
        case "Easy":
            return Color(red: 131/255, green: 215/255, blue: 151/255)
        case "Medium":
            return Color(red: 250/255, green: 220/255, blue: 100/255)
        case "Hard":
            return Color(red: 245/255, green: 129/255, blue: 129/255)
        default:
            return .white
        }
    }
}





let morningEz = [
    Exercise(
        name: "Meditating",
        intensity: "Easy",
        time: "10 mins",
        instructions: "Find a peaceful spot to sit or lie down. Close your eyes, take a deep breath, and let your mind relax. Focus on your breathing or listen to soothing sounds around you. Just be in the moment.",
        image: Image(.yoga),
        videoName: "placeholdername",
        url: URL(string:"https://www.wikihow.com/Meditate")!
    ),
    Exercise(
        name: "Skipping",
        intensity: "Easy",
        time: "20 mins",
        instructions: "Grab a skipping rope and find an open space. Start jumping to the rhythm of the rope as it swings beneath your feet. Try to keep a steady pace and enjoy the fun!",
        image: Image(.skipping),
        videoName: "placeholderName",
        url:URL(string:"https://www.wikihow.com/Jump-Rope")!
    ),
    Exercise(
        name: "Sit-Ups",
        intensity: "Easy",
        time: "10 mins",
        instructions: "Lie on your back on a comfortable surface. Bend your knees, place your feet flat on the ground, and cross your arms over your chest. Slowly lift your upper body toward your knees, then lower back down. Take your time and breathe!",
        image: Image(.situps),
        videoName: "placeholderName",
        url: URL(string:"https://www.wikihow.com/Do-a-Sit-Up")!
    ),
]

let morningMid = [
    Exercise(
        name: "Sit-Ups",
        intensity: "Medium",
        time: "20 mins",
        instructions: "Lie on your back on a comfortable surface. Bend your knees, place your feet flat on the ground, and cross your arms over your chest. Slowly lift your upper body toward your knees, then lower back down. Take your time and breathe!",
        image: Image(.situps),
        videoName: "placeholdername",
        url:URL(string:"https://www.wikihow.com/Do-a-Sit-Up")!
    ),
    Exercise(
        name: "Planks",
        intensity: "Medium",
        time: "20 mins",
        instructions: "Get into a push-up position, but rest on your forearms instead of your hands. Keep your body straight from head to toes, and hold the position. Breathe steadily and feel your strength building!",
        image: Image(.planks),
        videoName: "placeholderName",
        url: URL(string:"https://www.wikihow.com/Do-a-Plank")!
    ),
    Exercise(
        name: "Skipping",
        intensity: "Medium",
        time: "20 mins",
        instructions: "Grab a skipping rope and find an open space. Start jumping to the rhythm of the rope as it swings beneath your feet. Try to keep a steady pace and enjoy the fun!",
        image: Image(.skipping),
        videoName: "placeholderName",
        url: URL(string:"https://www.wikihow.com/Jump-Rope")!
    ),
]

let morningHard = [
    Exercise(
        name: "Cycling",
        intensity: "Hard",
        time: "30 mins",
        instructions: "Hop on your bike and explore a nearby park or a quiet street. Pedal at a comfortable pace, feeling the wind on your face as you go. Relax and enjoy the ride!",
        image: Image(.cycling),
        videoName: "placeholdername",
        url: URL(string:"https://www.wikihow.com/Ride-a-Bike")!
    ),
    Exercise(
        name: "Planks",
        intensity: "Hard",
        time: "30 mins",
        instructions: "Get into a push-up position, but rest on your forearms instead of your hands. Keep your body straight from head to toes, and hold the position. Breathe steadily and feel your strength building!",
        image: Image(.planks),
        videoName: "placeholderName",
        url: URL(string:"https://www.wikihow.com/Do-a-Plank")!
    ),
    Exercise(
        name: "Meditation",
        intensity: "Hard",
        time: "20 mins",
        instructions: "Find a peaceful spot to sit or lie down. Close your eyes, take a deep breath, and let your mind relax. Focus on your breathing or listen to soothing sounds around you. Just be in the moment.",
        image: Image(.yoga),
        videoName: "placeholderName",
        url: URL(string:"https://www.wikihow.com/Meditate")!
    ),
]

let nightEz = [
    Exercise(
        name: "Meditating",
        intensity: "Easy",
        time: "10 mins",
        instructions: "Find a peaceful spot to sit or lie down. Close your eyes, take a deep breath, and let your mind relax. Focus on your breathing or listen to soothing sounds around you. Just be in the moment.",
        image: Image(.yoga),
        videoName: "placeholdername",
        url: URL(string:"https://www.wikihow.com/Meditate")!
    ),
    Exercise(
        name: "Skipping",
        intensity: "Easy",
        time: "20 mins",
        instructions: "Grab a skipping rope and find an open space. Start jumping to the rhythm of the rope as it swings beneath your feet. Try to keep a steady pace and enjoy the fun!",
        image: Image(.skipping),
        videoName: "placeholderName",
        url: URL(string:"https://www.wikihow.com/Jump-Rope")!
    ),
    Exercise(
        name: "Sit-Ups",
        intensity: "Easy",
        time: "10 mins",
        instructions: "Lie on your back on a comfortable surface. Bend your knees, place your feet flat on the ground, and cross your arms over your chest. Slowly lift your upper body toward your knees, then lower back down. Take your time and breathe!",
        image: Image(.situps),
        videoName: "placeholderName",
        url: URL(string:"https://www.wikihow.com/Do-a-Sit-Up")!
    ),
]

let nightMid = [
    Exercise(
        name: "Sit-Ups",
        intensity: "Medium",
        time: "20 mins",
        instructions: "Lie on your back on a comfortable surface. Bend your knees, place your feet flat on the ground, and cross your arms over your chest. Slowly lift your upper body toward your knees, then lower back down. Take your time and breathe!",
        image: Image(.situps),
        videoName: "placeholdername",
        url: URL(string:"https://www.wikihow.com/Do-a-Sit-Up")!
    ),
    Exercise(
        name: "Planks",
        intensity: "Medium",
        time: "20 mins",
        instructions: "Get into a push-up position, but rest on your forearms instead of your hands. Keep your body straight from head to toes, and hold the position. Breathe steadily and feel your strength building!",
        image: Image(.planks),
        videoName: "placeholderName",
        url: URL(string:"https://www.wikihow.com/Do-a-Plank")!
    ),
    Exercise(
        name: "Skipping",
        intensity: "Medium",
        time: "20 mins",
        instructions: "Grab a skipping rope and find an open space. Start jumping to the rhythm of the rope as it swings beneath your feet. Try to keep a steady pace and enjoy the fun!",
        image: Image(.skipping),
        videoName: "placeholderName",
        url:URL(string:"https://www.wikihow.com/Jump-Rope")!
    ),
]

let nightHard = [
    Exercise(
        name: "Cycling",
        intensity: "Hard",
        time: "30 mins",
        instructions: "Hop on your bike and explore a nearby park or a quiet street. Pedal at a comfortable pace, feeling the wind on your face as you go. Relax and enjoy the ride!",
        image: Image(.cycling),
        videoName: "placeholdername",
        url: URL(string:"https://www.wikihow.com/Ride-a-Bike")!
    ),
    Exercise(
        name: "Planks",
        intensity: "Hard",
        time: "30 mins",
        instructions: "Get into a push-up position, but rest on your forearms instead of your hands. Keep your body straight from head to toes, and hold the position. Breathe steadily and feel your strength building!",
        image: Image(.planks),
        videoName: "placeholderName",
        url: URL(string:"https://www.wikihow.com/Do-a-Plank")!
    ),
    Exercise(
        name: "Meditation",
        intensity: "Hard",
        time: "20 mins",
        instructions: "Find a peaceful spot to sit or lie down. Close your eyes, take a deep breath, and let your mind relax. Focus on your breathing or listen to soothing sounds around you. Just be in the moment.",
        image: Image(.yoga),
        videoName: "placeholderName",
        url: URL(string:"https://www.wikihow.com/Meditate")!
    ),
]

let MorningExercises = [ morningEz, morningMid, morningHard ]
let EveningExercises = [ nightEz, nightMid, nightHard ]
