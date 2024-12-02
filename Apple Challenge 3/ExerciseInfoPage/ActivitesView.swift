


import SwiftUI

struct ActivitiesView: View {
    let exercise: Exercise
    
    @Binding var defaultExercise: Exercise
    @State private var isLoading = true
    var timeOfDay: String { Time.shared.timeOfDay }
    @State private var setDefaultAlertShowing: Bool = false
    
    var body: some View {
        ZStack {
            backgroundGradient(for: timeOfDay)
            NavigationStack {
                ScrollView {
                    VStack(spacing: 0) {
                        headerSection
                        exerciseDetailsSection
                        instructionsSection
                    }
                }
                .overlay(alignment: .bottom) {
                    bottomControlsSection
                }
                .background(backgroundGradient(for: timeOfDay))
            }
        }
    }
    
    private var headerSection: some View {
        GeometryReader { geometry in
            let offset = geometry.frame(in: .global).minY
            
            ZStack {
                exercise.image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .scaleEffect(max(1, 0.9 - offset / 300))
                    .opacity(Double(max(1, 0.1 - offset / 100)))
                    .clipped()
                    .offset(y: offset > 0 ? -offset : 0)
                
                backgroundGradient(for: timeOfDay)
                    .opacity(0.05)
                
            }
            .frame(height: max(200 - offset / 2, 400))
        }
        .frame(height: 200)
    }
    
    
    private var exerciseDetailsSection: some View {
        VStack {
            GeometryReader { geometry in
                let durationOffset = geometry.frame(in: .global).minY
                let scale = max(1, 0.7 - durationOffset / 300) 
                
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
                            .foregroundStyle(Color(.black))
                            .padding()
                            .background(exercise.IntensityColor)
                            .cornerRadius(8)
                            .frame(minHeight: 30)
                    }
                }
                .padding(.horizontal)
                .scaleEffect(scale)
            }
            .frame(height: 100)
        }
        .padding(.bottom, 50)
    }
    
    
    private var instructionsSection: some View {
        VStack(alignment: .center) { 
            Text("Instructions:")
                .multilineTextAlignment(.center)
                .font(.headline)
                .padding(.top, 16)
            
            Text(exercise.instructions)
                .multilineTextAlignment(.center)
                .lineLimit(nil)
                .padding(8)
                .background(exercise.IntensityColor)
                .cornerRadius(12)
                .font(.body)
        }
        .frame(maxWidth: .infinity)
    }

    
    private var bottomControlsSection: some View {
        VStack {
            HStack(spacing: 16) {
                Button {
                    withAnimation {
                        defaultExercise = exercise
                    }
                    setDefaultAlertShowing = true
                } label: {
                    Circle()
                        .frame(width: 60, height: 60)
                        .foregroundStyle(Color.blue)
                        .overlay(
                            Image(systemName: "homekit")
                                .font(.title2)
                                .foregroundColor(.white)
                        )
                }
                .alert("Successfully set as default!", isPresented: $setDefaultAlertShowing) {
                    Button("OK", role: .cancel) {}
                }
                
                NavigationLink(destination: ExerciseCountdown(exercise: exercise)) {
                    Circle()
                        .frame(width: 60, height: 60)
                        .foregroundStyle(Color.blue)
                        .overlay(
                            Image(systemName: "timer")
                                .font(.title2)
                                .foregroundColor(.white)
                        )
                }
                
                Button {
                    UIApplication.shared.open(exercise.url, options: [:], completionHandler: nil)
                } label: {
                    Circle()
                        .frame(width: 60, height: 60)
                        .foregroundStyle(Color.blue)
                        .overlay(
                            Image(systemName: "questionmark.text.page.fill")
                                .font(.title2)
                                .foregroundColor(.white)
                        )
                }
            }
            .padding(.vertical, 10)
            .padding(.bottom, 5)
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
        videoName: "placeholderName",
        url: URL(string: "https://www.wikihow.com")!
    )
    ActivitiesView(
        exercise: Exercise(
            name: "activity",
            intensity: "Medium",
            time: "6 min",
            instructions: "yes",
            image: Image("placeholderImage"),
            videoName: "placeholderName",
            url: URL(string: "https://www.wikihow.com")!
        ),
        defaultExercise: $defaultExercise
    )
}
