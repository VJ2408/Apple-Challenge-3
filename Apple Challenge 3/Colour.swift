////
////  Colour.swift
////  Apple Challenge 3
////
////  Created by Vijai Adithya on 22/11/24.
////
//
//import SwiftUI
//
//struct Colour: Identifiable {
//    var id = UUID() // Added to conform to `Identifiable`
//    var timeOfDay: String // "Morning" or "Evening"
//    
//    // Computed property for the background
//    var backgroundGradient: LinearGradient {
//        LinearGradient(
//            gradient: Gradient(colors: timeOfDay == "Morning" ?
//                [Color.yellow.opacity(0.5), Color.orange.opacity(0.7)] :
//                [Color.blue.opacity(0.7), Color.yellow.opacity(0.5)]),
//            startPoint: .bottomTrailing, // Start from bottom-right
//            endPoint: .topLeading
//        )
//    }
//}
