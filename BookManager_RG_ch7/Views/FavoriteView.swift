//
//  FavoriteView.swift
//  BookManager_RG_ch7
//
//  Created by Reginald Grant on 4/7/26.
//

import SwiftUI


struct FavoriteView: View {
    
    @Binding var books: [Book]
    
    // Computed Property
    private var favoriteBooks: [Book] {
        filterFavoriteBooks(book: books)
    }
    
    private var gridLayout: [GridItem]{
        [GridItem(.flexible()),GridItem(.flexible())]
    }
    
    
    var body: some View {
        NavigationStack{
            ScrollView{
                if favoriteBooks.isEmpty {
                    Text("No Favorite Books")
                        .foregroundStyle(.secondary)
                } else {
                    LazyVGrid(columns: gridLayout) {
                        ForEach(favoriteBooks) { book in
                            SquareCardView(book: book)
                            
                            
                        }
                        .padding()
                    }
                }
            }.navigationTitle("Favorite Books")        }
    }
}
