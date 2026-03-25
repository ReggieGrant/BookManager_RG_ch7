//
//  AddEditView.swift
//  BookManager_RG_ch7
//
//  Created by Reginald Grant on 3/24/26.
//

import SwiftUI

struct AddEditView: View {
    
    @Binding var book: Book
    
    @Environment(\.dismiss) var dismiss
    
    @State var title: String = ""
    @State var author: String = ""
    @State var summary: String = ""
    
    @State var selectedCover: String = "lotr_fellowship"
    
    var body: some View {
        NavigationStack{
            Form{
                Section(header: Text("Book Details")){
                    TextField("Title Of The Book", text: $book.title)
                    TextField("Author", text: $book.author)
                    TextEditor(text: $book.summary)
                        .frame(height: 150)
                    Picker("Cover", selection: $book.cover){
                        Text("The Fellowship of The Ring").tag("lotr_fellowship")
                        Text("The Two Towers").tag("lotr_towers")
                        Text("The Return Of The King").tag("lotr_king")
                    }
                }
            }
            .navigationTitle("Add Book")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .confirmationAction){
                    Button("Save"){
                        dismiss()
                    }
                }
            }
        }
    }
}

//#Preview {
//    AddEditView(
//        book: .constant(
//            Book(
//                title: "The Fellowship of the Ring",
//                author: "J.R.R. Tolkien",
//                summary: "A hobbit begins a journey to destroy a powerful ring.",
//                cover: "lotr_fellowship"
//            )
//        )
//    )
//}
