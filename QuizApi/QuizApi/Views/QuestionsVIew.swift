//
//  QuestionsVIew.swift
//  QuizApi
//
//  Created by Krishna on 03/11/22.
//

import SwiftUI

//var data :

struct QuestionsVIew: View {
    @EnvironmentObject var network : TrivalManager
    var body: some View {
        VStack(spacing: 30){
            HStack{
                
                Text("QuizZZZ").FirstTitle()
                Spacer()
                Text ("\(network.index+1) out of \(network.length)")
                    .foregroundColor(Color("AccentColor"))
                    .fontWeight(.heavy)
                    .onTapGesture {
                       print("tapped")
                    }

                    
                    
            }
            ProgressBar(parts: network.progress)
            
            VStack(spacing: 30){
            
                Text(network.question)
                .font(.system(size: 20))
                .fontWeight(.bold)
                
                ForEach(network.answerChoices,id: \.id){ answer in
                    AnswerRow(answer: answer)
                        .environmentObject(network)
                    
                }
               
            }
            
            
            Button{
                network.goToNextQuestion()
            } label: {
                PrimaryButton(text: "Next",background: network.answerSelected ? Color ("AccentColor"):Color(hue: 1.0, saturation: 0.0, brightness: 0.564,opacity: 0.327))
                
            }
            .disabled(!network.answerSelected)
            
        }
            .padding()
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .background(Color(red: 0.98, green: 0.92, blue: 0.847))
            
            
    }
}

struct QuestionsVIew_Previews: PreviewProvider {
    static var previews: some View {
        QuestionsVIew()
        .environmentObject(TrivalManager())
        
    }
}
