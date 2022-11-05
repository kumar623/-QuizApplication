//
//  Answer.swift
//  QuizApi
//
//  Created by Krishna on 03/11/22.
//

import SwiftUI


struct Answer : Identifiable{
    var id = UUID()
    var Text: AttributedString
    var isCorrect : Bool
}
