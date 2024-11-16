//
//  Activity.swift
//  Apple Challenge 3
//
//  Created by Dhanush  on 14/11/24.
//

import SwiftUI
import AVKit

struct ExerciseDemo: View {
    var body: some View {
        VideoPlayer(player: AVPlayer(url:  Bundle.main.url(forResource: "yoga", withExtension: "mp4")!)) {
            VStack {
                Text("Watermark")
                    .foregroundStyle(.black)
                    .background(.white.opacity(0.7))
                Spacer()
            }
            .frame(width: 400, height: 300)
        }
    }
}

#Preview {
    ExerciseDemo()
}
