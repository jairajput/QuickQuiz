//
//  ContentView.swift
//  QuickQuiz
//
//  Created by Jai  on 02/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack(spacing:40) {
                VStack(spacing:20){
                    Text("Quick Quiz")
                        .textModifier()
                    Text("Are You Ready For The Quiz")
                        .font(.title3)
                        .background(.gray)
                        .foregroundColor(.yellow)
                    
                    
                }
                NavigationLink{
                  QuickQuizView()
                }
            label:{
                PrimaryButton(text: "Lets Start The Quiz")
            }
                
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .background(Color(.gray))
        }
        
        
    }
}

#Preview {
    ContentView()
}
