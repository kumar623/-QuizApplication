//
//  ContentView.swift
//  QuizApi
//
//  Created by Krishna on 03/11/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var network = TrivalManager()
    var body: some View {
        NavigationView {
            VStack(spacing: 90){
                VStack(spacing: 20) {
                    
                    Text("Million Quiz")
                        .FirstTitle()
                    Text("Ready for the Quiz ?")
                        .foregroundColor(Color("AccentColor"))
                    
                    
                }
                NavigationLink {
                    TriviaView()
                        .environmentObject(network)
                        .navigationBarHidden(true)

                } label: {
                    PrimaryButton(text: "Start")
                }

                
            }.frame(maxWidth: .infinity,maxHeight: .infinity)
                .ignoresSafeArea()
            .background(Color(red: 0.98, green: 0.92, blue: 0.847))
        }
        }
        
      
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
