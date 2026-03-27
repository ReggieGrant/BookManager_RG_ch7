//
//  BookListItem.swift
//  BookManager_RG_ch7
//
//  Created by Reginald Grant on 3/24/26.
//

import SwiftUI

struct BookListItem: View {
    
    var book: Book
    
    var body: some View {
        
        HStack{
            Image(book.cover)
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 80)
            VStack(alignment: .leading){
                
                
                Text(book.title)
                    .font(.headline)
                if(!book.author.isEmpty){
                    Text("by \(book.author)")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    StarRatingView(rating: book.rating)
                }
                if(book.rating >= 1){
                    StarRatingView(rating: book.rating)
                }
            }
            }
        }
    }

