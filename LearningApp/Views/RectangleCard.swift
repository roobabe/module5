//
//  RectangleCard.swift
//  LearningApp
//
//  Created by Kynda Montero-Langston on 4/12/22.
//

import SwiftUI

struct RectangleCard: View {
    var color = Color.white

    var body: some View {
        
            Rectangle()
                .foregroundColor(color)
                .cornerRadius(10)
                .shadow(color: .gray, radius: 5, x: 5, y: 5)
            
    }
}

struct RectangleCard_Previews: PreviewProvider {
    static var previews: some View {
        RectangleCard()
    }
}
