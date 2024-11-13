// ActivitiesView.swift
// Apple Challenge 3
// Created by Vijai Adithya on 12/11/24.
//
//

import SwiftUI

struct ActivitiesView: View {
    let exercise: Exercise

   
    var body: some View {
        VStack {
            exercise.image
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(exercise.symbolColor)
                .padding()
            
           
            
            Text(exercise.name)
                .font(.subheadline)
                .fontWeight(.bold)
                .padding()
                .background(Color(.systemGray6))
                .frame(minHeight: 30)
                .cornerRadius(8)
                .frame(maxWidth: .infinity, alignment: .leading)

            
            HStack {
                Text("Duration: \(exercise.time)")
                    .font(.subheadline)
                    .padding()
                    .background(Color(.systemGray6))
                    .frame(minHeight: 30)
                    .cornerRadius(8)
                    .lineLimit(1)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                
                Text("Intensity: \(exercise.intensity)")
                    .font(.subheadline)
                    .foregroundColor(exercise.symbolColor)
                    .padding()
                    .background(Color(.systemGray6))
                    .frame(minHeight: 30)
                    .cornerRadius(8)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxWidth: .infinity)

            
            Text("Instructions:")
                .padding()
        }
        .navigationTitle("\(Time.shared.timeOfDay) \(exercise.name) Details")
        .padding()
    }
}

#Preview {
    ActivitiesView(exercise: Exercise(symbol: "figure.mind.and.body", name: "Bullshit Activity", intensity: "Hard as Hell", time: "To Infinity and Beyond"))
}
