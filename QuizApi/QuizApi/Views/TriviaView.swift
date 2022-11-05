//
//  TriviaView.swift
//  QuizApi
//
//  Created by Krishna on 03/11/22.
//

import SwiftUI

struct TriviaView: View {
    @EnvironmentObject var network : TrivalManager
    var body: some View {
        
        if network.reachedEnd{
            
            ZStack {
                LinearGradient(colors: [.blue,.red], startPoint: .topLeading, endPoint: .bottomTrailing)
                
                VStack(spacing: 40){
                    Text("QuizZZZZ")
                        .FirstTitle()
                    Text("Congratulation , you completed the game ")
                    
                    Text("You scored \(network.score) out of \(network.length)")
                    Button{
                        Task.init{
                          
                                await network.fetchTrival()
                            
                            
                        }
                    }label: {
                        PrimaryButton(text: "Play Again")
                    }
                }
            }.ignoresSafeArea()        }
        else{
            
            QuestionsVIew()
                .environmentObject(network)
        }
       
            

    }
}

struct TriviaView_Previews: PreviewProvider {
    static var previews: some View {
        TriviaView()
            .environmentObject(TrivalManager())
    }
}
