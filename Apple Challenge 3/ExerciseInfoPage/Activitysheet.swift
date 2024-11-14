// ActivitiesView.swift
// Apple Challenge 3
// Created by Vijai Adithya on 12/11/24.
//
//

import SwiftUI

struct ActivitiesView: View {
    let exercise: Exercise
    
    
    var body: some View {
        ScrollView{
            ZStack {
                exercise.image
                    .resizable()
                    .aspectRatio(contentMode:.fit)
                
                
                
                LinearGradient(gradient: Gradient(colors:[.clear, .clear, Color(.systemBackground)]),startPoint: .top, endPoint: .bottom)
                
            }
            VStack{
                Text(exercise.name)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .padding()
                    .background(Color(.systemGray6))
                    .frame(minHeight: 30)
                    .cornerRadius(8)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                
                HStack {
                    Text("Duration: \(exercise.time)")
                        .font(.subheadline)
                        .padding()
                        .background(Color(.systemGray6))
                        .frame(minHeight: 30)
                        .cornerRadius(8)
                        .lineLimit(1)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("Intensity: \(exercise.intensity)")
                        .font(.subheadline)
                        .foregroundColor(exercise.symbolColor)
                        .padding()
                        .background(Color(.systemGray6))
                        .frame(minHeight: 30)
                        .cornerRadius(8)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .frame(maxWidth: .infinity)
            }
            VStack(alignment: .leading) {
                Text("Instructions:")
                    .multilineTextAlignment(.center)
                    .font(.headline)
                Text(exercise.instructions)
                    .lineLimit(nil)
            }
            .padding(.horizontal)
        }
        .navigationTitle("\(Time.shared.timeOfDay) \(exercise.name) Details")
        .padding()
        .overlay(alignment:.bottom){
            VStack{
                Button{
                    //
                } label:{
                    ZStack{
                        Capsule()
                            .frame(height:40)
                        
                        Text("Set As Default")
                            .foregroundColor(Color(.black))
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(Color(.label))
                    }
                }
                .padding(.bottom)
                
                Button{
                    //Doing something
                } label:{
                    ZStack{
                        Capsule()
                            .frame(height:40)
                        
                        Text("Start WorkOut")
                            .foregroundColor(Color(.black))
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(Color(.label))
                        
                    }
                }
            }
            .foregroundColor(Color(.systemGray4))
            .padding()
        }
    }
}
    
        




                
#Preview {
    ActivitiesView(exercise: Exercise(symbol: "figure.mind.and.body", name: "Bullshit Activity", intensity: "Hard as Hell", time: "To Infinity and Beyond", instructions: "yyyfyfyfyfyfyfyfyfyfyfyfyfyfyfyfyfyfyfyfyfyfyfyfyfyfyfyyfyfyfyfyyfyfyfyyfyfyfyyfyfyfyfy"))
}
