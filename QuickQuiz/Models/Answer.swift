//
//  Answer.swift
//  QuickQuiz
//
//  Created by Jai  on 02/10/23.
//

import Foundation
struct Answer:Identifiable{
    var id = UUID()
    var text: AttributedString
    var isCorrect:Bool
}
