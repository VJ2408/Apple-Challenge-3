//
//  Activitysheet.swift
//  Apple Challenge 3
//
//  Created by Vijai Adithya on 12/11/24.
//
import SwiftUI
struct ActivitiesView: View {
    var body: some View {
        VStack {
            Text("Welcome to Activities!")
                .font(.title)
                .fontWeight(.bold)
                .padding()
         
            Text("This is where you choose your activities.")
        }
        .navigationTitle(" Activities")
    }
}
