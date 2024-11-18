//
//  ExerciseCountdown 2.swift
//  Apple Challenge 3
//
//  Created by Kenzie Vimalaputta Irawan on 18/11/24.
//


//
//  ExerciseVideo.swift
//  Apple Challenge 3
//
//  Created by Vijai Adithya on 18/11/24.
//

import SwiftUI
import AVKit


struct ExerciseCountdown: View {
    @Binding var countdownTimer: Int
    @Binding var showCountdown: Bool
    
    var body: some View {
        Text("\(countdownTimer)")
            .font(.system(size: 100, weight: .bold))
            .foregroundColor(.white)
            .shadow(radius: 10)
            .onChange(of: countdownTimer) { _, _ in
                if countdownTimer == 0 {
                    showCountdown = false
                }
            }
    }
}
