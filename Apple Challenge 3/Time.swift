//
//  Time.swift
//  Apple Challenge 3
//
//  Created by Vijai Adithya on 13/11/24.
//


import SwiftUI

class Time {
    static let shared = Time()
    
    
    var greeting: String {
        let hour = Calendar.current.component(.hour, from: Date())
        switch hour {
        case 0..<12: return "Good Morning"
        case 12..<17: return "Good Afternoon"
        default: return "Good Evening"
        }
    }
    
    var timeOfDay: String {
        let hour = Calendar.current.component(.hour, from: Date())
        switch hour {
        case 0..<12: return "Morning"
        case 12..<17: return "Morning"
        default: return "Morning"
        }
    }
    
    var exercisesForTimeOfDay: [[Exercise]] {
        switch timeOfDay {
        case "Morning": return MorningExercises
        default: return EveningExercises
        }
    }
}


