//
//  TrivalManager.swift
//  QuizApi
//
//  Created by Krishna on 03/11/22.
//

import SwiftUI
class TrivalManager : ObservableObject{
    private var trivia : [Trivia.Result] = []
    @Published private (set) var length = 0
    @Published private (set) var index = 0
    @Published private (set) var reachedEnd = false
    @Published private (set) var answerSelected = false
    @Published private (set) var question :  AttributedString = ""
    @Published private (set) var answerChoices: [Answer] = []
    @Published private (set) var progress : CGFloat = 0.00
    @Published private (set) var score : Int = 0
    
    
    init() {
            Task.init {
                await fetchTrival()
            }
        }
    
    func fetchTrival() async  {
        guard let url = URL(string: "https://opentdb.com/api.php?amount=10&category=18&type=multiple") else {fatalError("Missing URL")}
        
        
        let urlRequest = URLRequest(url: url)
        
        do{
            
            let (data,response) = try await URLSession.shared.data(for: urlRequest)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {fatalError("Error")}
            
            let decodedData = try JSONDecoder().decode(Trivia.self, from: data)
            
            DispatchQueue.main.async {
                print(UIScreen.main.bounds.size.width)
                print("dispatch queue called")
                self.score=0
                self.index=0
                self.progress = 0.0

                self.reachedEnd=false
                print("reacehed end false")
                self.trivia = decodedData.results
                self.length = self.trivia.count
                self.setQuestion()
            }
        }
            catch{
                print("ERROR",error)
            }
            
            
        }
    func goToNextQuestion (){
        if index + 1 < length{
            index += 1
            setQuestion()
            progress = CGFloat(Double((index + 1)) / Double(length) * 350.0)
            
        }
        else {
            reachedEnd = true
            print("Reached End")
        }
    }
    
    func setQuestion () {
        answerSelected = false
       
        if index<length{
            let currentTrivialQuestion = trivia[index]
            question = currentTrivialQuestion.formattedQuestion
            answerChoices = currentTrivialQuestion.answers
        }
    }
    func selectAnswer (answer : Answer){
        answerSelected = true
        if answer.isCorrect{
            score += 1
        }
    }
    
    }

