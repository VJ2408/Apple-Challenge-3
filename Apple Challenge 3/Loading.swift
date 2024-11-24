//
//  Loading.swift
//  Apple Challenge 3
//
//  Created by Vijai Adithya on 22/11/24.
//

import SwiftUI


struct LoadingView: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.5)
                .edgesIgnoringSafeArea(.all)
            VStack() {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .scaleEffect(2)
                Text("Loading...")
                    .foregroundColor(.white)
                    .font(.headline)
            }
        }
    }
}

