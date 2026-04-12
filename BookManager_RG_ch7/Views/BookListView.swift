//
//  BookListView.swift
//  BookManager_RG_ch7
//
//  Created by Reginald Grant on 4/7/26.
//


import SwiftUI
import SwiftData

struct BookListView: View {
    
    @Query var books: [PersistentBook]
    
    @State private var showAddBook: Bool = false
    @Environment(\.modelContext) private var modelContext
  
    
    @AppStorage("SETTINGS_FONT_SIZE_KEY") private var fontSize: Double = 16.0
    
    var body: some View {
        NavigationStack{
            
            List(books){ book in
                NavigationLink(destination: BookDetailView(book: book)) {
                    BookListItem(book: book)
                    
                }
                
                
            }
            .navigationTitle("Book Manager")
            .navigationBarItems(trailing: Button("Add Book") {
                showAddBook.toggle()
            })
            .sheet(isPresented: $showAddBook){
                AddEditView(modelContext: modelContext)
                
            }
            
        }
        .font(.system(size: fontSize))
    }
}
