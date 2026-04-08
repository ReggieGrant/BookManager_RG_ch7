//
//  BookDetailView.swift
//  BookManager_RG_ch7
//
//  Created by Reginald Grant on 3/24/26.
//

import SwiftUI

struct BookDetailView: View {
    
    
    @Binding var book: Book
    @State private var showEditBookSheet: Bool = false
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading){
                HStack{
                    Image(book.cover)
                        .resizable()
                        .scaledToFit()
                        .frame(width:100, height: 150)
                    
                    VStack{
                        Text(book.title)
                            .font(.largeTitle.bold())
                        if(!book.author.isEmpty){
                            Text("by: \(book.author)")
                                .font(.headline)
                                .foregroundColor(.secondary)
                        }
                    }
                    HStack{
                        Spacer()
                        FavoriteToggle(isFavorite: $book.isFavorite)
                    }
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.bottom)
                Text(book.summary)
                    .font(.subheadline)
                Spacer()
                Text("My Review")
                    .font(.title2)
                    .padding(.bottom)
                StarRatingView(rating: book.rating)
                Text(book.review)
                    .padding(8)
                Spacer()
            }
            
            
        }
        .padding()
        .navigationTitle("Book Details")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing: Button("Edit"){
            showEditBookSheet.toggle()
        })
        .sheet(isPresented: $showEditBookSheet,
               content:{
            AddEditView(book: $book)
        }
        )
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
