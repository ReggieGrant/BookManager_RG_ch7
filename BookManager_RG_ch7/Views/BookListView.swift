//
//  BookListView.swift
//  BookManager_RG_ch7
//
//  Created by Reginald Grant on 4/7/26.
//


import SwiftUI

struct BookListView: View {
    
    @Binding var books: [Book]
    
    @State private var showAddBook: Bool = false
    @State private var newBook = Book(title:"", author: "", summary: "", cover: "lotr_fellowship")
    
    var body: some View {
        NavigationStack{
            
            List($books){ book in
                NavigationLink(destination: BookDetailView(book: book)) {
                    BookListItem(book: book.wrappedValue)
                }
                
                
            }
            .navigationTitle("Book Manager")
            .navigationBarItems(trailing: Button("Add Book") {
                showAddBook.toggle()
            })
            .sheet(isPresented: $showAddBook){
                if(!newBook.title.isEmpty){
                    books.append(newBook)
                }
                newBook = Book(title:"",author:"", summary:"", cover:"lotr_fellowship")
            } content:{
                AddEditView(book: $newBook)
                
            }
            
        }
    }
}
