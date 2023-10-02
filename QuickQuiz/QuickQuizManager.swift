//
//  QuickQuizManager.swift
//  QuickQuiz
//
//  Created by Jai  on 02/10/23.
//

import Foundation
class QuickQuizManager:ObservableObject{
    private(set) var quickQuiz:[QuickQuiz.Result] = []
    private(set) var trivia: [QuickQuiz.Result] = []
    @Published private(set) var length = 0
    
    @Published private(set) var index = 0
    @Published private(set) var question: AttributedString = ""
    @Published private(set) var answerChoices: [Answer] = []
    
    @Published private(set) var score = 0
    @Published private(set) var progress: CGFloat = 0.00
    
    @Published private(set) var answerSelected = false
    @Published private(set) var reachedEnd = false
    
    init() {
        Task.init {
            await fetchQuickQuiz()
        }
    }
    
    
    func fetchQuickQuiz() async {
        guard let url = URL(string: "https://opentdb.com/api.php?amount=10") else { fatalError("Missing URL") }
        
        let urlRequest = URLRequest(url: url)
        
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
            
            let decoder = JSONDecoder()
            
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedData = try decoder.decode(QuickQuiz.self, from: data)
            
            DispatchQueue.main.async{
                self.index = 0
                self.score = 0
                self.progress = 0.00
                self.reachedEnd = false
                self.quickQuiz = decodedData.results
                self.length = self.quickQuiz.count
                self.setQuestion()
            }
        }
        catch{
            print("Error \(error)")
        }
    }
    func goToNextQuestion() {
        
        if index + 1 < length {
            index += 1
            setQuestion()
        } else {
            
            reachedEnd = true
        }
    }
    func setQuestion() {
        answerSelected = false
        progress = CGFloat(Double((index + 1)) / Double(length) * 350)
        
        if index < length {
            let currentQuickQuizQuestion = quickQuiz[index]
            question = currentQuickQuizQuestion.formattedQuestion
            answerChoices = currentQuickQuizQuestion.answers
        }
    }
    
    
    func selectAnswer(answer: Answer) {
        answerSelected = true
        
        if answer.isCorrect {
            score += 1
        }
    }
}
