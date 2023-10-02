//
//  QuestionView.swift
//  QuickQuiz
//
//  Created by Jai  on 02/10/23.
//

import SwiftUI

struct QuestionView: View {
    var body: some View {
        VStack(spacing: 40){
            HStack{
                Text("QuickQuiz")
                    .textModifier()
                Spacer()
                Text("1 of 10")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .background(.gray)
                
            }
            ProgressBar(progress: 40)
            VStack(alignment: .leading ,spacing: 20){
                Text("What is Ron Weasley&#039;s middle name?")
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.yellow)
                
                    AnswerRow(answer: Answer(text: "wowow", isCorrect: false))
                    AnswerRow(answer: Answer(text: "wowow", isCorrect: true))
            
                
            }
            PrimaryButton(text: "Next")
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(Color(.gray))
        .navigationBarHidden(true)
    }
}

#Preview {
    QuestionView()
}
