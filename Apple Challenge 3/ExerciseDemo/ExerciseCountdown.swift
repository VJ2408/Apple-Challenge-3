////
////////  ExerciseVideo.swift
////////  Apple Challenge 3
////////
////////  Created by Vijai Adithya on 18/11/24.
////////
////
////import SwiftUI
////import AVKit
////
////
////import SwiftUI
////
////struct ExerciseCountdown: View {
////    let exercise: Exercise
////    
////    @State private var timeRemaining: Int
////    @State private var isRunning = false
////    @State private var timerType = "Work"
////    @State private var breakDuration = 300 // 5 minutes default for breaks
////    
////    init(exercise: Exercise) {
////        self.exercise = exercise
////        self._timeRemaining = State(initialValue: Self.getTimeInSeconds(from: exercise.time))
////    }
////    
////    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
////    
////    var body: some View {
////        VStack(spacing: 40) {
////            Text(exercise.name)
////                .font(.largeTitle)
////                .fontWeight(.bold)
////            
////            Text(formatTime(timeRemaining))
////                .font(.system(size: 60, weight: .bold, design: .monospaced))
////                .foregroundColor(timerType == "Work" ? .red : .green)
////            
////            HStack(spacing: 20) {
////                Button(action: {
////                    isRunning.toggle()
////                }) {
////                    Image(systemName: isRunning ? "pause.circle.fill" : "play.circle.fill")
////                        .resizable()
////                        .frame(width: 60, height: 60)
////                        .foregroundColor(.blue)
////                }
////                
////                Button(action: resetTimer) {
////                    Image(systemName: "arrow.clockwise.circle.fill")
////                        .resizable()
////                        .frame(width: 60, height: 60)
////                        .foregroundColor(.orange)
////                }
////            }
////            
////            HStack(spacing: 20) {
////                VStack {
////                    Text("Break Duration")
////                    Picker("Break", selection: $breakDuration) {
////                        Text("5 min").tag(300)
////                        Text("10 min").tag(600)
////                        Text("15 min").tag(900)
////                    }
////                    .pickerStyle(.segmented)
////                }
////            }
////            .padding(.horizontal)
////        }
////        .onReceive(timer) { _ in
////            guard isRunning else { return }
////            
////            if timeRemaining > 0 {
////                timeRemaining -= 1
////            } else {
////                switchTimerType()
////            }
////        }
////        .padding()
////    }
////    
////    private func formatTime(_ seconds: Int) -> String {
////        let minutes = seconds / 60
////        let seconds = seconds % 60
////        return String(format: "%02d:%02d", minutes, seconds)
////    }
////    
////    private func resetTimer() {
////        isRunning = false
////        timeRemaining = timerType == "Work" ? Self.getTimeInSeconds(from: exercise.time) : breakDuration
////    }
////    
////    private func switchTimerType() {
////        if timerType == "Work" {
////            timerType = "Break"
////            timeRemaining = breakDuration
////        } else {
////            timerType = "Work"
////            timeRemaining = Self.getTimeInSeconds(from: exercise.time)
////        }
////    }
////    
////    private static func getTimeInSeconds(from timeString: String) -> Int {
////        let components = timeString.split(separator: " ")
////        guard let timeValue = Int(components.first ?? "0") else { return 0 }
////        return timeValue * 60
////    }
////}
////
////#Preview {
////    let sampleExercise = Exercise(
////        name: "Push-ups",
////        intensity: "High",
////        time: "10 min",
////        instructions: "Do as many push-ups as possible within the time limit.",
////        image: Image(systemName: "figure.walk"),
////        videoName: "pushups"
////    )
////    ExerciseCountdown(exercise: sampleExercise)
////}
////
import SwiftUI

struct ExerciseCountdown: View {
    let exercise: Exercise
    
    @State private var timeRemaining: Int
    @State private var isRunning = false
    @State private var setsCompleted = 0
    @State private var timerType = "Work"
    var timeOfDay: String { Time.shared.timeOfDay }
    @State private var breakDuration = 300 // 5 minutes default for breaks
    private let totalWorkTime: Int
    
    init(exercise: Exercise) {
        self.exercise = exercise
        self._timeRemaining = State(initialValue: Self.getTimeInSeconds(from: exercise.time))
        self.totalWorkTime = Self.getTimeInSeconds(from: exercise.time)
    }
    
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack{
            backgroundGradient(for: timeOfDay)            
            VStack(spacing: 40) {
                Text(exercise.name)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(Color.gray.opacity(0.8))
                    .fontWeight(.bold)
                
                ZStack {
                    Circle()
                        .stroke(
                            Color.gray.opacity(0.3),
                            style: StrokeStyle(lineWidth: 10, lineCap: .round)
                        )
                    
                    Circle()
                        .trim(from: 0, to: progress())
                        .stroke(
                            timerType == "Work" ? Color.red.opacity(0.4) : Color.green.opacity(0.4),
                            style: StrokeStyle(lineWidth: 10, lineCap: .round)
                        )
                    
                        .rotationEffect(.degrees(-90))
                        .animation(.linear, value: timeRemaining)
                    
                    Text(formatTime(timeRemaining))
                        .font(.system(size: 60, weight: .bold, design: .monospaced))
                        .foregroundColor(timerType == "Work" ? .red : .green)
                }
                .frame(width: 300, height: 300)
                
                HStack(spacing: 20) {
                    
                    Text("Sets Completed: \(setsCompleted)")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(Color.gray.opacity(0.8))
                    Button(action: {
                        isRunning.toggle()
                    }) {
                        Image(systemName: isRunning ? "pause.circle.fill" : "play.circle.fill")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .foregroundColor(.blue)
                    }
                    
                    Button(action: resetTimer) {
                        Image(systemName: "arrow.clockwise.circle.fill")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .foregroundColor(.orange)
                    }
                }
                
                HStack(spacing: 20) {
                    VStack {
                        Text("Break Duration")
                        Picker("Break", selection: $breakDuration) {
                            Text("5 min").tag(300)
                            Text("10 min").tag(600)
                            Text("15 min").tag(900)
                        }
                        .pickerStyle(.segmented)
                    }
                }
                .padding(.horizontal)
            }
            .onReceive(timer) { _ in
                guard isRunning else { return }
                
                if timeRemaining > 0 {
                    timeRemaining -= 1
                } else {
                    switchTimerType()
                }
            }
            .padding()
        }
    }
        
        private func formatTime(_ seconds: Int) -> String {
            let minutes = seconds / 60
            let seconds = seconds % 60
            return String(format: "%02d:%02d", minutes, seconds)
        }
        
        private func resetTimer() {
            isRunning = false
            timeRemaining = timerType == "Work" ? totalWorkTime : breakDuration
        }
        
        
        private func switchTimerType() {
            if timerType == "Work" {
                setsCompleted += 1 // Increment the set counter at the end of "Work" session
                timerType = "Break"
                timeRemaining = breakDuration
            } else {
                timerType = "Work"
                timeRemaining = totalWorkTime
            }
        }
        
        private func progress() -> CGFloat {
            let totalTime = timerType == "Work" ? totalWorkTime : breakDuration
            return CGFloat(timeRemaining) / CGFloat(totalTime)
        }
        
        private static func getTimeInSeconds(from timeString: String) -> Int {
            let components = timeString.split(separator: " ")
            guard let timeValue = Int(components.first ?? "0") else { return 0 }
            return timeValue * 60
        }
    }


#Preview {
    let sampleExercise = Exercise(
        name: "Push-ups",
        intensity: "High",
        time: "10 min",
        instructions: "Do as many push-ups as possible within the time limit.",
        image: Image(systemName: "figure.walk"),
        videoName: "pushups",
        url: URL(string:"placeholder")!
    )
    ExerciseCountdown(exercise: sampleExercise)
}


//import SwiftUI
//
//struct ExerciseCountdown: View {
//    let exercise: Exercise
//    @State private var timeRemaining: Int
//    @State private var isRunning = false
//    @State private var setsCompleted = 0
//    @State private var timerType = "Work"
//    @State private var breakDuration = 300 // 5 minutes default for breaks
//    private let totalWorkTime: Int
//    var timeOfDay: String { Time.shared.timeOfDay }
//    
//    init(exercise: Exercise) {
//        self.exercise = exercise
//        self._timeRemaining = State(initialValue: Self.getTimeInSeconds(from: exercise.time))
//        self.totalWorkTime = Self.getTimeInSeconds(from: exercise.time)
//    }
//    
//    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
//
//    var body: some View {
//        ZStack {
//            backgroundGradient(for: timeOfDay) // Applying gradient background
//            
//            VStack(spacing: 40) {
//                Text(exercise.name)
//                    .font(.system(size: 20, weight: .semibold))
//                    .foregroundColor(Color.gray.opacity(0.8))
//                    .fontWeight(.bold)
//                
//                ZStack {
//                    Circle()
//                        .stroke(
//                            Color.gray.opacity(0.3),
//                            style: StrokeStyle(lineWidth: 10, lineCap: .round)
//                        )
//                    
//                    Circle()
//                        .trim(from: 0, to: progress())
//                        .stroke(
//                            timerType == "Work" ? Color.red.opacity(0.4) : Color.green.opacity(0.4),
//                            style: StrokeStyle(lineWidth: 10, lineCap: .round)
//                        )
//                        .rotationEffect(.degrees(-90))
//                        .animation(.linear, value: timeRemaining)
//                    
//                    Text(formatTime(timeRemaining))
//                        .font(.system(size: 60, weight: .bold, design: .monospaced))
//                        .foregroundColor(timerType == "Work" ? .red : .green)
//                }
//                .frame(width: 300, height: 300)
//                
//                HStack(spacing: 20) {
//                    Text("Sets Completed: \(setsCompleted)")
//                        .font(.system(size: 20, weight: .semibold))
//                        .foregroundColor(Color.gray.opacity(0.8))
//                    Button(action: {
//                        isRunning.toggle()
//                    }) {
//                        Image(systemName: isRunning ? "pause.circle.fill" : "play.circle.fill")
//                            .resizable()
//                            .frame(width: 60, height: 60)
//                            .foregroundColor(.blue)
//                    }
//                    
//                    Button(action: resetTimer) {
//                        Image(systemName: "arrow.clockwise.circle.fill")
//                            .resizable()
//                            .frame(width: 60, height: 60)
//                            .foregroundColor(.blue)
//                    }
//                }
//                
//                Text("Next: \(timerType == "Work" ? "Take a Break" : "Work Again")")
//                    .font(.system(size: 22, weight: .semibold))
//                    .foregroundColor(.gray.opacity(0.7))
//            }
//            .onReceive(timer) { _ in
//                guard isRunning else { return }
//                
//                if timeRemaining > 0 {
//                    timeRemaining -= 1
//                } else {
//                    // Timer expires, handle state transitions
//                    handleTimerEnd()
//                }
//            }
//        }
//        .edgesIgnoringSafeArea(.all)
//    }
//    
//    private func handleTimerEnd() {
//        if timerType == "Work" {
//            setsCompleted += 1
//            timeRemaining = breakDuration // Set break duration
//            timerType = "Break"
//        } else {
//            timeRemaining = totalWorkTime // Reset to work duration
//            timerType = "Work"
//        }
//    }
//
//    private func resetTimer() {
//        timeRemaining = totalWorkTime
//        setsCompleted = 0
//        timerType = "Work"
//    }
//
//    private static func getTimeInSeconds(from time: String) -> Int {
//        let components = time.split(separator: ":")
//        guard components.count == 2,
//              let minutes = Int(components[0]),
//              let seconds = Int(components[1]) else { return 0 }
//        return minutes * 60 + seconds
//    }
//    
//    private func formatTime(_ time: Int) -> String {
//        let minutes = time / 60
//        let seconds = time % 60
//        return String(format: "%02d:%02d", minutes, seconds)
//    }
//
//    private func progress() -> CGFloat {
//        let total = timerType == "Work" ? totalWorkTime : breakDuration
//        return CGFloat(1 - Double(timeRemaining) / Double(total))
//    }
//}
