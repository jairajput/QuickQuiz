//
//  QuickQuizView.swift
//  QuickQuiz
//
//  Created by Jai  on 02/10/23.
//
import SwiftUI


struct QuickQuizView: View {
    @EnvironmentObject var quickQuizManager: QuickQuizManager
    var body: some View {
        if quickQuizManager.reachedEnd {
            VStack(spacing: 20) {
                Text("Quick Quiz Game")
                    
                Text("Congratulations, you completed the game! 🥳")
                
                Text("You scored \(quickQuizManager.score) out of \(quickQuizManager.length)")
                
                Button {
                    Task.init {
                        await quickQuizManager.fetchQuickQuiz()
                    }
                } label: {
                    PrimaryButton(text: "Play again")
                }
            }
            .foregroundColor(Color("AccentColor"))
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118))
        } else {
            QuestionView()
                .environmentObject(quickQuizManager)
        }
    }
}

#Preview {
    QuickQuizView()
        .environmentObject(QuickQuizManager())
}

