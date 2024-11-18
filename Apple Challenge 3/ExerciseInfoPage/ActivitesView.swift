// ActivitiesView.swift
// Apple Challenge 3
// Created by Vijai Adithya on 12/11/24.
//
//

import SwiftUI

struct ActivitiesView: View {
    let exercise: Exercise
    
    @Binding var defaultExercise: Exercise
    @State private var setDefaultAlertShowing: Bool = false
    
    var body: some View {
        NavigationStack{
            ScrollView{
                ZStack {
                    exercise.image
                        .resizable()
                        .aspectRatio(contentMode:.fit)
                    
                    LinearGradient(gradient: Gradient(colors:[.clear, .clear, Color(.systemBackground)]),startPoint: .top, endPoint: .bottom)
                }
                
                VStack{
                    Text(exercise.name)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                        .frame(minHeight: 30, alignment: .center)
                        .background(Color(.systemGray6))
                        .lineLimit(1)
                        .cornerRadius(8)
                        .offset(x: -18, y: -100)
                    
                    HStack{
                        Text("Duration: \(exercise.time)")
                            .padding()
                            .background(Color(.systemGray6))
                            .frame(minHeight: 30)
                            .cornerRadius(8)
                            .lineLimit(1)
                            .offset(x: -25, y: -100)
                        
                        Text("Intensity: \(exercise.intensity)")
                            .foregroundStyle(exercise.intensity == "Medium" ? Color(.black) : Color(.white))
                            .padding()
                            .background(exercise.intensitycolor)
                            .frame(minHeight: 30)
                            .cornerRadius(8)
                            .offset(x: -25, y: -100)
                    }
                    .padding(.bottom)
                }
                
                
              .overlay(alignment: .top){
                    VStack(alignment: .center) {
                        Text("Instructions:")
                            .padding(.top)
                            .padding(.top)
                            .padding(.top)
                            .multilineTextAlignment(.center)
                            .font(.headline)
                        
                        Text(exercise.instructions).fixedSize(horizontal: false, vertical: true)
                            .lineLimit(nil)
                        
                        
                    }
                    
                    
                }
            }
            
            .overlay(alignment:.bottom){
                VStack{
                    Button{
                        
                        defaultExercise = exercise
                        setDefaultAlertShowing = true
                        
                    } label:{
                        ZStack{
                            RoundedRectangle(cornerRadius: 14)
                                .frame(height: 50)
                                .padding(.horizontal)
                                .foregroundStyle(.blue)
                            
                            Text("Set as default")
                                .foregroundColor(Color(.white))
                                .font(.title2)
                                .padding()
                        }
                    }
                    .alert("Successfully set as default!", isPresented: $setDefaultAlertShowing) {
                    }
                    
                    NavigationLink{
                        ExerciseDemo(timerDuration: 300, exercise: exercise)
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 14)
                                .frame(height: 50)
                                .padding(.horizontal)
                                .foregroundStyle(.blue)
                            
                            Text("Start")
                                .foregroundColor(Color(.white))
                                .font(.title2)
                                .padding(.horizontal)
                                .bold()
                        }
                    }
                }
                .padding(.bottom, 30)
                .foregroundColor(Color(.systemGray4))
            }
            .ignoresSafeArea(.all)
        }
    }
}

#Preview {
    @Previewable @State var defaultExercise = Exercise(name: "", intensity: "", time: "", instructions: "", image: Image("placeholderImage"),videoName: "placeholderName")
    ActivitiesView(exercise: Exercise( name: "Activity", intensity: "Medium", time: "6 min", instructions: "yes", image: Image(.yoga),videoName: "placeholderName"), defaultExercise: $defaultExercise)
}
