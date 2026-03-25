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
                    Text("by \(book.author)")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }

