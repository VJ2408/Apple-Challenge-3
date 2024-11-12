import SwiftUI

struct ContentView: View {
    // Search bar
    @State private var searchText = ""
    
    // Based on time of day
    var greeting: String {
        let hour = Calendar.current.component(.hour, from: Date())
        switch hour {
        case 0..<12:
            return "Good Morning"
        case 12..<17:
            return "Good Afternoon"
        default:
            return "Good Evening"
        }
    }
    
    var timeOfDay: String {
        let hour = Calendar.current.component(.hour, from: Date())
        switch hour {
        case 0..<12:
            return "Morning"
        case 12..<17:
            return "Afternoon"
        default:
            return "Evening"
        }
    }
    
    // Exercises for the current time of day
    var exercisesForTimeOfDay: [[Exercise]] {
        switch timeOfDay {
        case "Morning":
            return Morningexercises
        case "Afternoon":
            return Afternoonexercises
        default:
            return Eveningexercises
        }
    }
    
    // Filtered exercises
    var filteredExercises: [Exercise] {
        if searchText.isEmpty {
            return exercisesForTimeOfDay.flatMap { $0 }
        } else {
            return exercisesForTimeOfDay.flatMap { $0 }.filter { exercise in
                exercise.name.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    // Grouped by intensity
    var groupedExercises: [(intensity: String, exercises: [Exercise])] {
        [
            ("Easy", filteredExercises.filter { $0.intensity == "Easy" }),
            ("Medium", filteredExercises.filter { $0.intensity == "Medium" }),
            ("Hard", filteredExercises.filter { $0.intensity == "Hard" })
        ]
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    // Greeting
                    Text(greeting)
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .padding()
                    
                    // Search bar
                    TextField("Search Activities", text: $searchText)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding([.leading, .trailing], 16)
                    
                    // Activities based on time of day
                    Text("\(timeOfDay) Activities")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(Color.gray.opacity(0.7))
                        .padding([.leading, .trailing], 16)
                        .padding(.top, 16)
                    
                    ForEach(groupedExercises, id: \.intensity) { group in
                        VStack(alignment: .leading) {
                            Text(group.intensity)
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundColor(Color.gray.opacity(0.7))
                                .padding([.leading, .trailing], 16)
                                .padding(.top, 16)
                            
                            Divider()
                                .background(Color.gray)
                                .padding(.bottom, 8)
                            
                            // Horizontal scroll for exercises
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 16) {
                                    ForEach(group.exercises) { exercise in
                                        VStack {
                                            exercise.image
                                                .foregroundColor(exercise.symbolColor)
                                                .font(.system(size: 60))
                                            
                                            HStack {
                                                Text(exercise.name)
                                                    .font(.system(size: 14))
                                                    .lineLimit(1)
                                                
                                                Text(" \(exercise.time)")
                                                    .font(.system(size: 14))
                                                    .foregroundColor(.secondary)
                                                    .lineLimit(1)
                                                    .minimumScaleFactor(0.5)
                                            }
                                        }
                                        .padding()
                                        .frame(minHeight: 120)
                                        .background(Color(.systemGray6))
                                        .cornerRadius(8)
                                    }
                                }
                                .padding([.leading, .trailing], 16)
                            }
                        }
                    }
                }
            }
            .navigationTitle("")
        }
    }
}

#Preview {
    ContentView()
}
