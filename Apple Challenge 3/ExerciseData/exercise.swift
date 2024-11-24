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
    
//    var symbol: Image {
//        Image(.symbolName)
//    }
    
    
    
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




//data for morning, afternoon, night. categorised by difficulty
let morningEz = [
    Exercise( name: "Meditating", intensity: "Easy", time: "5 mins", instructions: "Yololol", image: Image(.yoga), videoName: "placeholdername"),
    Exercise( name: "Walking", intensity: "Easy", time: "10 mins", instructions: "Yololol", image: Image(.walk), videoName: "placeholderName"),
    Exercise( name: "Stretches", intensity: "Easy", time: "3 mins", instructions: "Yololol", image: Image(.stretch), videoName: "placeholderName"),
]

let morningMid = [
    Exercise( name: "Meditating", intensity: "Medium", time: "5 mins", instructions: "Yololol", image: Image(.yoga), videoName: "placeholdername"),
    Exercise( name: "Walking", intensity: "Medium", time: "10 mins", instructions: "Yololol", image: Image(.walk), videoName: "placeholderName"),
    Exercise( name: "Stretches", intensity: "Medium", time: "3 mins", instructions: "Yololol", image: Image(.stretch), videoName: "placeholderName"),
]

let morningHard = [
    Exercise( name: "Meditating", intensity: "Hard", time: "5 mins", instructions: "Yololol", image: Image(.yoga), videoName: "placeholdername"),
    Exercise( name: "Walking", intensity: "Hard", time: "10 mins", instructions: "Yololol", image: Image(.walk), videoName: "placeholderName"),
    Exercise( name: "Stretches", intensity: "Hard", time: "3 mins", instructions: "Yololol", image: Image(.stretch), videoName: "placeholderName"),
]
let nightEz = [
    Exercise( name: "Meditating", intensity: "Easy", time: "5 mins", instructions: "Yololol", image: Image(.yoga), videoName: "placeholdername"),
    Exercise( name: "Walking", intensity: "Easy", time: "10 mins", instructions: "Yololol", image: Image(.walk), videoName: "placeholderName"),
    Exercise( name: "Stretches", intensity: "Easy", time: "3 mins", instructions: "Yololol", image: Image(.stretch), videoName: "placeholderName"),
]
let nightMid = [
    Exercise( name: "Meditating", intensity: "Medium", time: "5 mins", instructions: "Yololol", image: Image(.yoga), videoName: "placeholdername"),
    Exercise( name: "Walking", intensity: "Medium", time: "10 mins", instructions: "Yololol", image: Image(.walk), videoName: "placeholderName"),
    Exercise( name: "Stretches", intensity: "Medium", time: "3 mins", instructions: "Yololol", image: Image(.stretch), videoName: "placeholderName"),
]

let nightHard = [
    Exercise( name: "Meditating", intensity: "Hard", time: "5 mins", instructions: "Yololol", image: Image(.yoga), videoName: "placeholdername"),
    Exercise( name: "Walking", intensity: "Hard", time: "10 mins", instructions: "Yololol", image: Image(.walk), videoName: "placeholderName"),
    Exercise( name: "Stretches", intensity: "Hard", time: "3 mins", instructions: "Yololol", image: Image(.stretch), videoName: "placeholderName"),
]

let MorningExercises = [ morningEz, morningMid, morningHard ]
let EveningExercises = [ nightEz, nightMid, nightHard ]
