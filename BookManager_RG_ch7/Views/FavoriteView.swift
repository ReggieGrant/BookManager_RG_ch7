//
//  FavoriteView.swift
//  BookManager_RG_ch7
//
//  Created by Reginald Grant on 4/7/26.
//

import SwiftUI
import SwiftData


struct FavoriteView: View {
    
    @Query var books: [PersistentBook]
    
    @State var selectedGenre: Genre? = nil
    @State var selectedReadingStatus: ReadingStatus? = nil
    @State var showFilters: Bool = false
    
    @AppStorage("SETTINGS_GRID_COLUMNS_KEY") private var gridColumns: Int = 2
    
    // Computed Property
    private var favoriteBooks: [PersistentBook] {
        filterFavoriteBooks(book: books, genre: selectedGenre,
readingStatus: selectedReadingStatus)
    }
    
    private var gridLayout: [GridItem]{
//        [GridItem(.flexible()),GridItem(.flexible())]
        Array(repeating: GridItem(.flexible()), count: gridColumns)
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
            }.navigationTitle("Favorite Books")
                .navigationBarItems(leading: Button("Filter"){
                    
                    showFilters.toggle()
                })
                .sheet(isPresented: $showFilters,
                       content:{
                    FilterView(selectedGenre: $selectedGenre, selectedReadingStatus: $selectedReadingStatus)
                }
                )
          
        }
    }
}
