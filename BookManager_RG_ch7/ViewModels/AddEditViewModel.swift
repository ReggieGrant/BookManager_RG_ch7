//
//  AddEditViewModel.swift
//  BookManager_RG_ch7
//
//  Created by Reginald Grant on 4/22/26.
//

import SwiftUI
import SwiftData
internal import Combine

@MainActor
class AddEditViewModel: ObservableObject {
    
    private var book: PersistentBook?
    private var modelContext: ModelContext
    
    @Published var title: String
    @Published var author: String
    @Published var summary: String
    @Published var rating: Int
    @Published var review: String
    @Published var genre: Genre
    @Published var readingStatus: ReadingStatus
    @Published var coverData: Data?
    
    var navigationTitle: String {
        book == nil ? "Add Book" : "Edit Book"
    }
    
    var isNotSavable: Bool {
        title.trimmingCharacters(in:
                .whitespacesAndNewlines).isEmpty
        || title == book?.title
        && author == book?.author
        && summary == book?.summary
        && rating == book?.rating
        && review == book?.review
        //&& isFavorite == book?.isfavorite
        && genre == book?.genre
        && readingStatus == book?.readingStatus
        && coverData == book?.coverData
    }
    
    
    init(book: PersistentBook? = nil, modelContext: ModelContext) {
        self.modelContext = modelContext
        
        if let book {
            title = book.title
            author = book.author
            summary = book.summary
            rating = book.rating
            review = book.review
            genre = book.genre
            readingStatus = book.readingStatus
            coverData = book.coverData
            self.book = book
        } else {
            title = ""
            author = ""
            summary = ""
            rating = 0
            review = ""
            genre = .unknown
            readingStatus = .unknown
            coverData = nil
        }
    }
    func saveBook(){
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
    }
}
