//
//  Trivia.swift
//  QuizApi
//
//  Created by Krishna on 03/11/22.
//

import Foundation
import SwiftUI


struct Trivia : Decodable {
    
    var results : [Result]
    
    struct Result : Decodable,Identifiable {
        var id: UUID{
            return UUID()
        }
        
        var category : String
        var type : String
        var difficulty : String
        var question : String
        var correct_answer :  String
        var incorrect_answers : [String]
        
        
        var formattedQuestion: AttributedString {
                    do {
                        return try AttributedString(markdown: question)
                    } catch {
                        print("Error setting formattedQuestion: \(error)")
                        return ""
                    }
                }
        var answers : [Answer]{
            
            do{
                let correct = [Answer(Text:  try AttributedString(markdown: correct_answer), isCorrect:  true  )]
                let incorrect = try incorrect_answers.map{ answers in
                    Answer(Text: try AttributedString(markdown: answers), isCorrect: false)
                    
                }
                let allAnswers = correct + incorrect
                return allAnswers.shuffled()
                }
                
            catch {
                print("Error setting formattedQuestion: \(error)")
                return []
                
            }
            
        }
        
        
       
        
    }
    
}
