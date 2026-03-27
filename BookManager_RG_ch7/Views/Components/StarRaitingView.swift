//
//  StarRaitingView.swift
//  BookManager_RG_ch7
//
//  Created by Reginald Grant on 3/25/26.
//

import SwiftUI


struct StarRatingView: View {
    var rating: Int
    
    var body: some View {
        HStack(spacing: 10){
            ForEach(1...5, id: \.self){ number in
                Image(systemName: number <= self.rating ? "star.fill" : "star")
                    .font(.title3)
                    .foregroundColor(.yellow)
            }
        }
    }
}
