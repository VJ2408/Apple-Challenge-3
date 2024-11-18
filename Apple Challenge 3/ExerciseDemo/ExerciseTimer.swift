//
//  Untitled.swift
//  Apple Challenge 3
//
//  Created by Kenzie Vimalaputta Irawan on 18/11/24.
//



//
//  ExerciseTimer.swift
//  Apple Challenge 3
//
//  Created by Vijai Adithya on 18/11/24.
//

import SwiftUI

struct ExerciseTimer: View {
    @Binding var timerDuration: Int
    @Binding var currentSet: Int
    
    var body: some View {
        HStack {
            Text("Time Left: \(formattedTime(timerDuration))")
                .font(.title2)
                .bold()
                .foregroundColor(.white)
                .padding(.horizontal, 10)
                .background(Color.black.opacity(0.6))
                .cornerRadius(10)

            Spacer()

            Text("Set: \(currentSet)/3")
                .font(.title2)
                .bold()
                .foregroundColor(.white)
                .padding(.horizontal, 10)
                .background(Color.black.opacity(0.6))
                .cornerRadius(10)
        }
    }
    
    private func formattedTime(_ seconds: Int) -> String {
        let minutes = seconds / 60
        let remainingSeconds = seconds % 60
        return String(format: "%02d:%02d", minutes, remainingSeconds)
    }
}
