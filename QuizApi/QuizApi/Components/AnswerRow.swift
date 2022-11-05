//
//  AnswerRow.swift
//  QuizApi
//
//  Created by Krishna on 03/11/22.
//

import SwiftUI

struct AnswerRow: View {
    @EnvironmentObject var networks : TrivalManager
    var  answer : Answer
    @State private var isSelected = false
     
    var green : Color = Color(.green)
    var red : Color = Color(.red)
    
    var body: some View {
        HStack(spacing: 20){
            Image(systemName: "circle.fill")
                .font(.caption)
            Text(answer.Text)
            
            
            if   isSelected {
                Spacer()
                Image(systemName: answer.isCorrect ? "checkmark.circle.fill" : "x.circle.fill")
                    .foregroundColor(answer.isCorrect ? green : red)
            }
        }
        .padding()
        .frame(maxWidth: .infinity,alignment: .leading)
        .foregroundColor(isSelected ? Color("AccentColor" ) : .gray)
        .background(.white)
        .cornerRadius(20)
        .shadow(color: isSelected ? answer.isCorrect ? green:red : .gray, radius: 5)
        .onTapGesture {
            if  !networks.answerSelected{
                isSelected = true
                networks.selectAnswer(answer: answer)
            }
           
        }
    
    }
}

struct AnswerRow_Previews: PreviewProvider {
    static var previews: some View {
        AnswerRow(answer: Answer( Text: " Single", isCorrect: true))
            .environmentObject(TrivalManager())
    }

}
