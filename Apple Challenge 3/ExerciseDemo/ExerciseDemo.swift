//
//import SwiftUI
//import AVKit
//
//struct ExerciseDemo: View {
//    var body: some View {
//        VideoPlayer(player: AVPlayer(url:  Bundle.main.url(forResource: "yoga", withExtension: "mp4")!)) {
//            VStack {
//                Text("Watermark")
//                    .foregroundStyle(.black)
//                    .background(.white.opacity(0.7))
//                Spacer()
//            }
//            .frame(width: 400, height: 300)
//        }
//    }
//}
//
//#Preview {
//    ExerciseDemo()
//}


import SwiftUI
import AVKit
//import ExerciseDemoVideos

struct ExerciseDemo: View {
    @State var currentSet = 0
    @State var countdownTimer: Int = 3
    @State private var isPaused = false
    @State private var activityCompleted = false
    @State var showCountdown = true
    @State private var restMode = false
    @State var timerDuration: Int
    @State private var timerRunning = false
    @State private var countdownTimerRunning = false

    let exercise: Exercise
    private var videoPlayer: AVPlayer? {
        guard let url = Bundle.main.url(forResource: "ExerciseDemoVideos/placeholdername", withExtension: "mp4") else {
            print("Error: Video URL not found")
            return nil
        }
        let player = AVPlayer(url: url)
        player.isMuted = true
        return player
    }

    init(timerDuration: Int, exercise: Exercise) {
        self._timerDuration = State(initialValue: timerDuration)
        self.exercise = exercise
    }

    var body: some View {
        ZStack {
            GeometryReader { geometry in
                if let videoPlayer = videoPlayer {
                    VideoPlayer(player: videoPlayer)
                        .edgesIgnoringSafeArea(.all)
                        .onAppear {
                            videoPlayer.play()
//                            startCountdown()
                        }
                        .onDisappear {
                            videoPlayer.pause()
                        }
                        .onTapGesture {
                            togglePlayPause(videoPlayer: videoPlayer)
                        }
                } else {
                    Text("Video not available")
                        .font(.title)
                        .foregroundColor(.red)
                }
                
//                // Countdown before video starts
//                if showCountdown {
//                    ExerciseCountdown(countdownTimer: $countdownTimer, showCountdown: $showCountdown)
//                    onChange(of: countdownTimer) { _, _ in
//                        if countdownTimer == 0 {
//                            startTimer()
//                        }
//                    }
//                }
                    
            }

//            VStack {
//                HStack {
//                    if !showCountdown {
//                        ExerciseTimer(timerDuration: $timerDuration, currentSet: $currentSet)
//                    }
//                }
//                .padding()
//
//                Spacer()
//            }


//            if activityCompleted {
//                VStack {
//                    Text("Exercise Complete!")
//                        .font(.largeTitle)
//                        .bold()
//                        .foregroundColor(.white)
//                        .padding()
//
//                    Button(action: resetExercise) {
//                        Text("Try Again")
//                            .font(.title2)
//                            .padding()
//                            .background(Color.blue)
//                            .foregroundColor(.white)
//                            .cornerRadius(10)
//                    }
//                }
//            }
        }
    }

//    private func startCountdown() {
//            if countdownTimerRunning { return }
//            countdownTimerRunning = true
//        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
//            if countdownTimer > 0 {
//                countdownTimer -= 1
//            } else {
//                timer.invalidate()
//                showCountdown = false
//                videoPlayer?.play()
//                startTimer()
//            }
//        }
//    }
//
//    func startTimer() {
//        timerRunning = true
//        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
//            guard timerRunning else { timer.invalidate(); return }
//
//            if timerDuration > 0 {
//                timerDuration -= 1
//            } else {
//                timer.invalidate()
//                completeSet()
//            }
//        }
//    }
//
//    private func completeSet() {
//        currentSet += 1
//        if currentSet < 3 {
//            restMode = true
//            timerDuration = 120
//            DispatchQueue.main.asyncAfter(deadline: .now() + 120) {
//                restMode = false
//                timerDuration = Int(exercise.time.split(separator: " ")[0])! * 60
//                startTimer()
//            }
//        } else {
//            activityCompleted = true
//            videoPlayer?.pause()
//        }
//    }

    private func togglePlayPause(videoPlayer: AVPlayer) {
        isPaused.toggle()
        if isPaused {
            videoPlayer.pause()
            timerRunning = false
            countdownTimerRunning = false
        } else {
            videoPlayer.play()
            timerRunning = true
            countdownTimerRunning = true
        }
    }

//    private func resetExercise() {
//        currentSet = 0
//        timerDuration = Int(exercise.time.split(separator: " ")[0])! * 60
//        countdownTimer = 3
//        showCountdown = true
//        activityCompleted = false
//        videoPlayer?.seek(to: .zero)
//        videoPlayer?.play()
//        startCountdown()
//    }

}

struct ExerciseDemo_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseDemo(timerDuration: 300, exercise: morningEz[0])  
    }
}
