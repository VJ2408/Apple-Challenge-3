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




let exerciseyoga = [
    Exercise(symbol: "figure.mind.and.body", name: "Yoga", intensity: "Easy", time: "3 min", instructions: "Yololol"),
    Exercise(symbol: "figure.mind.and.body", name: "Running", intensity: "Easy", time: " 3 min", instructions: "Yololol"),
    Exercise(symbol: "figure.mind.and.body", name: "Walking", intensity: "Easy", time: "3 min", instructions: "Yololol"),
]

let exerciserun = [
    Exercise(symbol: "figure.mind.and.body", name: "Yoga", intensity: "Medium", time: "3 min", instructions: "Yololol"),
    Exercise(symbol: "figure.mind.and.body", name: "Running", intensity: "Medium", time: "3 min", instructions: "Yololol"),
    Exercise(symbol: "figure.mind.and.body", name: "Walking", intensity: "Medium", time: "3 min", instructions: "Yololol"),
]

let exercisewalk = [
    Exercise(symbol: "figure.mind.and.body", name: "Yoga", intensity: "Hard", time: "3 min", instructions: "Yololol"),
    Exercise(symbol: "figure.mind.and.body", name: "Running", intensity: "Hard", time: "3 min", instructions: "Yololol"),
    Exercise(symbol: "figure.mind.and.body", name: "Walking", intensity: "Hard", time: "3 min", instructions: "Yololol"),
]

let exercisecalisthenics = [
    Exercise(symbol: "figure.mind.and.body", name: "Yoga", intensity: "Easy", time: "3 min", instructions: "Yololol"),
    Exercise(symbol: "figure.mind.and.body", name: "Running", intensity: "Easy", time: "3 min", instructions: "Yololol"),
    Exercise(symbol: "figure.mind.and.body", name: "Walking", intensity: "Easy", time: "3 min", instructions: "Yololol"),
]

let exercisestretches = [
    Exercise(symbol: "figure.mind.and.body", name: "Yoga", intensity: "Medium", time: "3 min", instructions: "Yololol"),
    Exercise(symbol: "figure.mind.and.body", name: "Running", intensity: "Medium", time: "3 min", instructions: "Yololol"),
    Exercise(symbol: "figure.mind.and.body", name: "Walking", intensity: "Medium", time: "3 min", instructions: "Yololol"),
]

let exercisesitups = [
    Exercise(symbol: "figure.mind.and.body", name: "Yoga", intensity: "Hard", time: "3 min", instructions: "Yololol"),
    Exercise(symbol: "figure.mind.and.body", name: "Running", intensity: "Hard", time: "3 min", instructions: "Yololol"),
    Exercise(symbol: "figure.mind.and.body", name: "Walking", intensity: "Hard", time: "3 min", instructions: "Yololol")
]

let exercisesquats = [
    Exercise(symbol: "figure.mind.and.body", name: "Yoga", intensity: "Easy", time: "3 min", instructions: "Yololol"),
    Exercise(symbol: "figure.mind.and.body", name: "Running", intensity: "Easy", time: "3 min", instructions: "Yololol"),
    Exercise(symbol: "figure.mind.and.body", name: "Walking", intensity: "Easy", time: "3 min", instructions: "Yololol")
]

let exercisepushups = [
    Exercise(symbol: "figure.mind.and.body", name: "Yoga", intensity: "Medium", time: "3 min", instructions: "Yololol"),
    Exercise(symbol: "figure.mind.and.body", name: "Running", intensity: "Medium", time: "3 min", instructions: "Yololol"),
    Exercise(symbol: "figure.mind.and.body", name: "Walking", intensity: "Medium", time: "3 min", instructions: "Yololol")
]

let exercisenope = [
    Exercise(symbol: "figure.mind.and.body", name: "Walk", intensity: "Hard", time: "3 min", instructions: "Yololol"),
    Exercise(symbol: "figure.mind.and.body", name: "Running", intensity: "Hard", time: "3 min", instructions: "Yololol"),
    Exercise(symbol: "figure.mind.and.body", name: "Walking", intensity: "Hard", time: "3 min", instructions: "Yololol")
]


let Morningexercises = [ exerciseyoga,exerciserun,exercisewalk]
let Afternoonexercises = [ exercisesitups,exercisesquats,exercisepushups]
let Eveningexercises = [ exercisestretches,exercisenope,exercisecalisthenics]
