//
//  AddEditView.swift
//  BookManager_RG_ch7
//
//  Created by Reginald Grant on 3/24/26.
//

import SwiftUI
import SwiftData

struct AddEditView: View {
    
    var book: PersistentBook?
    private var modelContext: ModelContext
    
    @Environment(\.dismiss) var dismiss
    
    @State var title: String = ""
    @State var author: String = ""
    @State var summary: String = ""
    @State var rating: Int = 0
    @State var review: String = ""
    @State var genre: Genre = .unknown
    @State var readingStatus: ReadingStatus = .unknown
    
    @State var coverData: Data? = nil
    
    init(book: PersistentBook? = nil, modelContext: ModelContext){
        self.book = book
        self.modelContext = modelContext
        if let book = book {
            self._title = .init(wrappedValue: book.title)
            self._author = .init(wrappedValue: book.author)
            self._summary = .init(wrappedValue: book.summary)
            self._rating = .init(wrappedValue: book.rating)
            self._review = .init(wrappedValue: book.review)
            self._genre = .init(wrappedValue: book.genre)
            self._readingStatus = .init(wrappedValue: book.readingStatus)
            self._coverData = .init(wrappedValue: book.coverData)
        }
    }
    
    var body: some View {
        NavigationStack{
            Form{
                Section(header: Text("Book Details")){
                    TextField("Title Of The Book", text: $title)
                    TextField("Author", text: $author)
                    TextEditor(text: $summary)
                        .frame(height: 150)
                    Picker("Genre",selection: $genre){
                        ForEach(Genre.allCases, id:\.self){ genre in
                            Text(genre.rawValue).tag(genre)
                            
                        }
                    }

                    
                }
                Section(header: Text("My Review")){
                    Picker("Reading Status",selection: $readingStatus){
                        ForEach(ReadingStatus.allCases, id:\.self){ readingStatus in
                            Text(readingStatus.rawValue).tag(readingStatus)
                            
                        }
                        ImageField(data: $coverData)
                    }
                    Picker("Rating", selection: $rating){
                        Text("No Rating selected...").tag(0)
                        ForEach(1...5, id: \.self){ num in
                            Text(String(num)).tag(num)
                        }
                    }
                    TextEditor(text: $review)
                        .frame(height: 150)
                }
            }
            .navigationTitle(book == nil ? "Add Book": "Edit Book")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .confirmationAction){
                    Button("Save"){
                        let isNewBook = book == nil
                        let bookToSave = book ?? PersistentBook(title:"")
                        
                        
                        bookToSave.title = title
                        bookToSave.author = author
                        bookToSave.summary = summary
                        bookToSave.rating = rating
                        bookToSave.review = review
                        
                        bookToSave.genre = genre
                        bookToSave.readingStatus = readingStatus
                        if(coverData != nil){
                            bookToSave.coverData = coverData
                        }
                        if isNewBook {
                            modelContext.insert(bookToSave)
                        }
                        do{
                           try modelContext.save()
                        } catch {
                            print("Could not save book: \(error)")
                        }
                        dismiss()
                    }.disabled(title.isEmpty)
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
