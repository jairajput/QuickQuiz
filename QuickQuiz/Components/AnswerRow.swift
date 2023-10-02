//
//  AnswerRow.swift
//  QuickQuiz
//
//  Created by Jai  on 02/10/23.
//

import SwiftUI

struct AnswerRow: View {
    @State private var isSelected = false
    var green = Color(hue: 0.437, saturation: 0.711, brightness: 0.711)
    var red = Color(red: 0.71, green: 0.094, blue: 0.1)
    var answer:Answer
    var body: some View {
        HStack(spacing:20){
        Image(systemName: "circle.fill")
            Text(answer.text)
                .bold()
            
            if isSelected{
                Spacer()
                
                Image(systemName: answer.isCorrect ? "checkmark.circle.fill":"x.circle.fill")
                    .foregroundColor(answer.isCorrect ? green:red)
            }
        }
        .padding()
        .frame(maxWidth: .infinity,alignment: .leading)
        .foregroundColor(isSelected ? Color(.blue) : .black)
        .backgroundStyle(.white)
        .cornerRadius(10)
        .shadow(color: isSelected ? (answer.isCorrect ? green : red ):.black, radius: 10, x: 0.9,y: 0.5)
        .onTapGesture {
            isSelected = true
        }
        
    }
}

#Preview {
    AnswerRow(answer: Answer(text: "Text is Single", isCorrect: false))
}
