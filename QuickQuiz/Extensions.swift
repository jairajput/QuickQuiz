//
//  Extensions.swift
//  QuickQuiz
//
//  Created by Jai  on 02/10/23.
//

import Foundation
import SwiftUI
extension Text{
    func textModifier () -> some View{
        self.foregroundColor(.yellow)
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .fontWeight(.heavy)
            .background(.gray)
    }
}

