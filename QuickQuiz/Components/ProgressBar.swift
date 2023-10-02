//
//  ProgressBar.swift
//  QuickQuiz
//
//  Created by Jai  on 02/10/23.
//

import SwiftUI

struct ProgressBar: View {
    var progress: CGFloat
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .frame(maxWidth: 350, maxHeight: 4)
                .foregroundColor(Color(hue: 0.594, saturation: 1.0, brightness: 0.597, opacity: 0.327))
                .cornerRadius(10)
            
            Rectangle()
                .frame(width: progress, height: 4)
                .foregroundColor(Color(.init(red: 0.1, green: 0.1, blue: 0.1, alpha: 0.9)))
                .cornerRadius(10)
        }
    }
}
#Preview {
    ProgressBar(progress: 10)
}
