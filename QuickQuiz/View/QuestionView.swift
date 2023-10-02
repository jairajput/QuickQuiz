//
//  QuestionView.swift
//  QuickQuiz
//
//  Created by Jai  on 02/10/23.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var quickQuizManager : QuickQuizManager
    var body: some View {
        VStack(spacing: 40){
            HStack{
                Text("QuickQuiz")
                    .textModifier()
                Spacer()
                
                Text("\(quickQuizManager.index + 1) out of \(quickQuizManager.length)")
                    .foregroundColor(Color("AccentColor"))
                    .fontWeight(.heavy)
            }
            
            ProgressBar(progress: quickQuizManager.progress)
            
            VStack(alignment: .leading, spacing: 20) {
                Text(quickQuizManager.question)
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.black)
                
                ForEach(quickQuizManager.answerChoices, id: \.id) { answer in
                    AnswerRow(answer: answer)
                        .environmentObject(quickQuizManager)
                }
            }
            
            Button {
                quickQuizManager.goToNextQuestion()
            } label: {
                PrimaryButton(text: "Next", background: quickQuizManager.answerSelected ? Color("AccentColor") : Color(hue: 1.0, saturation: 0.0, brightness: 0.564, opacity: 0.327))
            }
            .disabled(!quickQuizManager.answerSelected)
            
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
        .environmentObject(QuickQuizManager())
}
