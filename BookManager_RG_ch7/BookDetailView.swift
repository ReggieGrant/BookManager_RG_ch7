//
//  BookDetailView.swift
//  BookManager_RG_ch7
//
//  Created by Reginald Grant on 3/24/26.
//

import SwiftUI

struct BookDetailView: View {
    var book: Book
    
    var body: some View {
        
        VStack{
            HStack{
                Image(book.cover)
                    .resizable()
                    .scaledToFit()
                    .frame(width:100, height: 100)
                Spacer()
                VStack{
                    Text(book.title)
                        .font(.largeTitle.bold())
                    Text("by: \(book.author)")
                        .font(.headline)
                    
                }
                Spacer()
            }
            Text(book.summary)
                .font(.subheadline)
        }
    
        
    }
}

//#Preview {
//    BookDetailView(
//        book: Book(
//            title: "Sample Book",
//            author: "Sample Author",
//            summary: "Sample summary"
//        )
//    )
//}
