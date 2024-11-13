//
//  exercisedetails.swift
//  Apple Challenge 3
//
//  Created by Vijai Adithya on 12/11/24.
//

import SwiftUI

struct exercisedetailsView: View{
    let exercise: Exercise
    var body: some View{
        
        VStack(alignment: .leading){
            exercise.image
                .resizable()
                .aspectRatio(CGSize(width:10, height: 10), contentMode: .fit)
           
            Text("\(Text("\(exercise.time)").font(.title).fontWeight(.bold).baselineOffset(6.6)) Min")
            
            Text(exercise.name)
                .font(.headline)
                .lineLimit(2, reservesSpace: true)
            
            Text(exercise.intensity)
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .padding(.bottom)
            
            
        }
    }
    
}
