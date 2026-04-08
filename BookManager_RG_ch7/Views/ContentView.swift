//
//  ContentView.swift
//  BookManager_RG_ch7
//
//  Created by Reginald Grant on 3/24/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
   
    @State private var books = getBooks()


    var body: some View {
        
        TabView{
            BookListView(books:$books)
                .tabItem{
                    Label("Books", systemImage: "books.vertical.fill")
                }
            FavoriteView(books: $books)
                .tabItem{
                    Label("Favorites", systemImage: "heart.fill")
                }
        }
                
    }
    
}
    


    


#Preview {
    ContentView()
        
}
