//
//  Food.swift
//  QuizApi
//
//  Created by Krishna on 04/11/22.
//

import Foundation
struct Food: Identifiable, Decodable {
    var id: Int
    var uid: String
    var dish: String
    var description: String
    var ingredient: String
    var measurement: String
}
