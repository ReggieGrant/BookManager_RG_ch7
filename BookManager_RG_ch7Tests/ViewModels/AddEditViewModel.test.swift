//
//  AddEditViewModel.test.swift
//  BookManager_RG_ch7
//
//  Created by Reginald Grant on 4/22/26.
//

import Testing
@testable import BookManager_RG_ch7
import SwiftData
import Foundation

@MainActor
struct AddEditViewModeltests {
    
    // init with no book
    @Test func initWithNoBook() throws {
        //arrange
        let container = try ModelContainer(
            for: PersistentBook.self,
            configurations: .init(isStoredInMemoryOnly: true)
        )
        let modelContext = container.mainContext
        //act
        let viewModel = AddEditViewModel(modelContext: modelContext)
        
        // assert
        #expect(viewModel.title == "")
        #expect(viewModel.author == "")
        #expect(viewModel.summary == "")
        #expect(viewModel.rating == 0)
        #expect(viewModel.review == "")
        #expect(viewModel.genre == .unknown)
        #expect(viewModel.readingStatus == .unknown)
        #expect(viewModel.coverData == nil)
        
        
        
    }
    
    
    // init with a book
    @Test func initWithEditableBook() throws {
        //arrange
        let container = try ModelContainer(
            for: PersistentBook.self,
            configurations: .init(isStoredInMemoryOnly: true)
        )
        let modelContext = container.mainContext
        let book = PersistentBook(
            title: "Test Title",
            author: "Test Author",
            summary: "Test Summary",
            coverData: Data((0...1024).description.utf8),
            rating: 4,
            review: "Test Review",
            genre: .sciFi,
            readingStatus: .finished,
            
            
        )
        //act
        let viewModel = AddEditViewModel(book: book,modelContext: modelContext)
        
        // assert
        #expect(viewModel.title == book.title)
        #expect(viewModel.author == book.author)
        #expect(viewModel.summary == book.summary)
        #expect(viewModel.rating == book.rating)
        #expect(viewModel.review == book.review)
        #expect(viewModel.genre == book.genre)
        #expect(viewModel.readingStatus == book.readingStatus)
        #expect(viewModel.coverData == book.coverData)
        
        
    }
    // checking isNotsavable works
    
    // test navigationTitle is correct
    
    // test savBook function works
}
