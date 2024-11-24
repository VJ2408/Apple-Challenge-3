


import SwiftUI

struct ActivitiesView: View {
    let exercise: Exercise
    
    @Binding var defaultExercise: Exercise
    @State private var isLoading = true
    var timeOfDay: String { Time.shared.timeOfDay }
    @State private var setDefaultAlertShowing: Bool = false
    
    
    var body: some View {
        ZStack{
            backgroundGradient(for: timeOfDay)
            
            NavigationStack {
                ScrollView {
                    VStack(spacing: 0) {
                        GeometryReader { geometry in
                            let offset = geometry.frame(in: .global).minY
                            
                            ZStack {
                                exercise.image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .scaleEffect(max(1.2, 1 - offset / 300))
                                    .opacity(Double(max(1, 0.2 - offset / 200)))
                                    .clipped()
                                    .offset(y: offset > 0 ? -offset : 0) // Fixes the bounce-down behavior
                                
                                LinearGradient(
                                    gradient: Gradient(colors: [.clear, .clear, Color(.systemGray6)]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            }
                            .frame(height: max(200 - offset / 2, 400)) // Adjusts the image container's height
                        }
                        .frame(height: 200)
                        
                        VStack {
                            GeometryReader { geometry in
                                let durationOffset = geometry.frame(in: .global).minY
                                let scale = max(1, 0.7 - durationOffset / 300) // Controls scaling
                                
                                VStack(alignment: .leading) {
                                    Text(exercise.name)
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .padding()
                                        .background(Color(.systemGray5))
                                        .cornerRadius(8)
                                        .lineLimit(2)
                                        .padding(.bottom)
                                    
                                    HStack(spacing: 16) {
                                        Text("Duration: \(exercise.time)")
                                            .padding()
                                            .background(Color(.systemGray5))
                                            .cornerRadius(8)
                                            .frame(minHeight: 30)
                                            .lineLimit(1)
                                        
                                        Text("Intensity: \(exercise.intensity)")
                                            .foregroundStyle(exercise.intensity == "Medium" ? Color(.black) : Color(.white))
                                            .padding()
                                            .background(exercise.IntensityColor)
                                            .cornerRadius(8)
                                            .frame(minHeight: 30)
                                    }
                                }
                                .padding(.horizontal)
                                .scaleEffect(scale) // Dynamically scales the content
                            }
                            .frame(height: 100) // Set a height to ensure layout consistency
                        }
                        .padding(.bottom, 50)
                        
                        VStack(alignment: .leading) {
                            Text("Instructions:")
                                .multilineTextAlignment(.center)
                                .font(.headline)
                                .padding(.top, 16)
                            
                            Text(exercise.instructions)
                                .lineLimit(nil)
                                .padding(8)
                                .background(exercise.IntensityColor.opacity(0.2))
                                .cornerRadius(12)
                                .font(.body)
                        }
                    }
                }
                .overlay(alignment: .bottom) {
                    VStack {
                        
                        HStack(spacing: 16) {
                            
                            Button {
                                withAnimation {
                                    defaultExercise = exercise
                                }
                                setDefaultAlertShowing = true
                            } label: {
                                Circle()
                                    .frame(width: 60, height: 60) // Circular button
                                    .foregroundStyle(Color.blue)
                                    .overlay(
                                        Image(systemName: "house.fill")
                                            .font(.title2)
                                            .foregroundColor(.white)
                                    )
                            }
                            .alert("Successfully set as default!", isPresented: $setDefaultAlertShowing) {
                                Button("OK", role: .cancel) {}
                            }
                            
                            // Timer Navigation Button
                            NavigationLink(destination: ExerciseCountdown(exercise: exercise)) {
                                Circle()
                                    .frame(width: 60, height: 60) // Circular button
                                    .foregroundStyle(Color.blue)
                                    .overlay(
                                        Image(systemName: "timer")
                                            .font(.title2)
                                            .foregroundColor(.white)
                                    )
                            }
                            
                            // Play Button (Placeholder action)
                            Button {
                                // Action for play button
                            } label: {
                                Circle()
                                    .frame(width: 60, height: 60) // Circular button
                                    .foregroundStyle(Color.blue)
                                    .overlay(
                                        Image(systemName: "play.fill")
                                            .font(.title2)
                                            .foregroundColor(.white)
                                    )
                            }
                        }
                        .padding(.vertical, 10) // Vertical padding for the button group
                        .padding(.bottom, 5) // Padding from the bottom of the screen
                    }
                }
                .background(Color(.systemGray6))
            }
            
        }
        
    }
}

#Preview {
    @Previewable @State var defaultExercise = Exercise(
        name: "",
        intensity: "",
        time: "",
        instructions: "",
        image: Image("placeholderImage"),
        videoName: "placeholderName"
    )
    ActivitiesView(
        exercise: Exercise(
            name: "activity",
            intensity: "Medium",
            time: "6 min",
            instructions: "yes",
            image: Image("placeholderImage"),
            videoName: "placeholderName"
        ),
        defaultExercise: $defaultExercise
    )
}
