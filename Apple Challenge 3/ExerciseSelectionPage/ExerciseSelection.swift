//
//  EntireFile.swift
//  Apple Challenge 3
//
//  Created by Vijai Adithya on 22/11/24.
//

import SwiftUI

struct ExerciseSelection: View {
    @State private var searchText = ""
    @State private var isLoading = true
    
    let exercise: Exercise
    @Binding var defaultExercise: Exercise
    
    var greeting: String { Time.shared.greeting }
    var timeOfDay: String { Time.shared.timeOfDay }
    var exercisesForTimeOfDay: [[Exercise]] { Time.shared.exercisesForTimeOfDay }
    
    // Filtered exercises based on the search query
    var filteredExercises: [Exercise] {
        exercisesForTimeOfDay
            .flatMap { $0 }
            .filter { exercise in
                searchText.isEmpty || exercise.name.lowercased().contains(searchText.lowercased())
            }
    }
    
    // Groups exercises by intensity
    var groupedExercises: [(intensity: String, exercises: [Exercise])] {
        [
            ("Easy", filteredExercises.filter { $0.intensity.lowercased() == "easy" }),
            ("Medium", filteredExercises.filter { $0.intensity.lowercased() == "medium" }),
            ("Hard", filteredExercises.filter { $0.intensity.lowercased() == "hard" })
        ]
    }
    
    // Intensity color
    func intensityColor(for exercise: Exercise) -> Color {
        switch exercise.intensity.lowercased() {
        case "easy":
            return Color(red: 131/255, green: 215/255, blue: 151/255) // Green
        case "medium":
            return Color(red: 250/255, green: 220/255, blue: 100/255) // Yellow
        case "hard":
            return Color(red: 245/255, green: 129/255, blue: 129/255) // Red
        default:
            return .gray
        }
    }
    
    var body: some View {
        ZStack {
            backgroundGradient(for: timeOfDay)
            
            NavigationStack {
                ScrollView {
                    VStack(spacing: 16) {
                        // Default Exercise Section
                        VStack(alignment: .leading, spacing: 16) {
                            Text("Default Activity")
                                .font(.headline)
                                .foregroundColor(.black.opacity(0.5))
                                .padding([.leading, .trailing], 16)
                                .padding(.top, 16)
                            
                            VStack {
                                defaultExercise.image
                                    .resizable()
                                    .frame(width: 120, height: 120)
                                    .padding()
                                
                                Text(defaultExercise.name)
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                
                                HStack {
                                    Text(defaultExercise.intensity)
                                        .font(.footnote)
                                        .foregroundColor(.black)
                                    
                                    Text(defaultExercise.time)
                                        .font(.footnote)
                                        .foregroundColor(.black)
                                }
                                .padding(.top, 8)
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(defaultExercise.name == "You haven't set a default exercise yet!"
                                        ? Color.white
                                        : intensityColor(for: defaultExercise))
                            .cornerRadius(8)
                            .shadow(radius: 5)
                            .padding(.horizontal, 16)
                            
                            // Time of Day Section
                            Text("\(timeOfDay) Activities")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding([.leading, .trailing], 16)
                                .padding(.top, 16)
                            
                            // Grouped Exercises
                            ForEach(groupedExercises, id: \.intensity) { group in
                                VStack(alignment: .leading) {
                                    Text(group.intensity)
                                        .font(.headline)
                                        .foregroundColor(.black.opacity(0.5))
                                        .padding([.leading, .trailing], 16)
                                        .padding(.top, 16)
                                    
                                    Divider()
                                        .background(Color.gray)
                                        .padding(.bottom, 8)
                                    
                                    ScrollView(.horizontal, showsIndicators: false) {
                                        HStack(spacing: 16) {
                                            ForEach(group.exercises) { exercise in
                                                NavigationLink(destination: ActivitiesView(exercise: exercise, defaultExercise: $defaultExercise)) {
                                                    VStack {
                                                        exercise.image
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fit)
                                                            .frame(width: 80, height: 80)
                                                        
                                                        VStack {
                                                            Text(exercise.name)
                                                                .font(.footnote)
                                                                .lineLimit(1)
                                                                .foregroundColor(.black)
                                                            
                                                            Text("\(exercise.time)")
                                                                .font(.footnote)
                                                                .foregroundColor(.black)
                                                                .lineLimit(1)
                                                                .minimumScaleFactor(0.5)
                                                        }
                                                    }
                                                    .padding()
                                                    .frame(width: 246, height: 200)
                                                    .background(intensityColor(for: exercise))
                                                    .cornerRadius(8)
                                                }
                                            }
                                        }
                                    }
                                    .padding([.leading, .trailing], 16)
                                }
                            }
                        }
                    }
                    .background( backgroundGradient(for: timeOfDay))
                }
                .navigationTitle("Activities")
                .toolbarBackground(LinearGradient(gradient: Gradient(colors: gradientColors(for: timeOfDay)), startPoint: .top, endPoint: .bottom).opacity(0.5), for: .navigationBar)  // Apply gradient to navigation bar
                .toolbarBackground(.visible, for: .navigationBar)
                    .searchable(text: $searchText)
                .background( backgroundGradient(for: timeOfDay))
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        isLoading = false
                    }
                }
            }
            if isLoading {
                LoadingView()
                    .transition(.opacity)
            }
        }
    }
}

func backgroundGradient(for timeOfDay: String) -> some View {
    let colors: [Color] = gradientColors(for: timeOfDay)
    
    return LinearGradient(gradient: Gradient(colors: colors), startPoint: .top, endPoint: .bottom)
        .opacity(0.3)  // Lower opacity to emphasize text more
        .edgesIgnoringSafeArea(.all)  // Ensure the gradient covers the entire background
}

// Determine gradient colors based on the time of day
func gradientColors(for timeOfDay: String) -> [Color] {
    switch timeOfDay.lowercased() {
    case "morning":
        
        return [Color(red: 51/255, green: 140/255, blue: 202/255).opacity(0.5),
                Color(red: 30/255, green: 70/255, blue: 140/255).opacity(0.7)]
    case "evening":
        
        return [Color(red: 64/255, green: 104/255, blue: 217/255).opacity(0.5),
                Color(red: 67/255, green: 46/255, blue: 140/255).opacity(0.7)]
    default:
        
        return [Color(red: 211/255, green: 211/255, blue: 211/255).opacity(0.7),
                Color.white.opacity(0.7)]
    }
}

#Preview {
    @Previewable @State var defaultExercise = Exercise(
        name: "You haven't set a default exercise yet!",
        intensity: "Medium",
        time: "Tap on an exercise to set it as default!",
        instructions: "",
        image: Image("placeholder"), // Replace with your asset name
        videoName: "placeholderName",
        url: URL(string:"placeholder")!
    )
    ExerciseSelection(
        exercise: Exercise(
            name: "Yoga Stretch",
            intensity: "Easy",
            time: "10 minutes",
            instructions: "Placeholder Instructions",
            image: Image("stretch"), // Replace with your asset name
            videoName: "stretchVideo",
            url: URL(string:"placeholder")!
        ),
        defaultExercise: $defaultExercise
    )
}




