//
//  ContentView.swift
//  BookManager_RG_ch7
//
//  Created by Reginald Grant on 3/24/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
   
    private let books = getBooks()

    var body: some View {
        NavigationStack{
            
            List(books){ book in
                NavigationLink(destination: BookDetailView(book: book)) {
                    BookListItem(book: book)
                }
                
                
            }
        }.navigationBarTitle("Book Manager")
        }
    }

    


#Preview {
    ContentView()
        
}
