//
//  ColoredCapsule.swift
//  BookManager_RG_ch7
//
//  Created by Reginald Grant on 4/8/26.
//

import SwiftUI

struct ColoredCapsule: View {
    var text: String
    var color: Color = Color.accentColor
    
    var body: some View {
        Text(text)
            .font(.caption)
            .foregroundColor(.black)
            .fontWeight(.bold)
            .padding(8)
            .background(color.opacity(0.2))
            .clipShape(Capsule())
            
    }
}
