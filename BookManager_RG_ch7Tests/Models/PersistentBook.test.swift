//
//  PersistentBook.test.swift
//  BookManager_RG_ch7
//
//  Created by Reginald Grant on 4/13/26.
//

import Testing // Swift Testing

@testable import BookManager_RG_ch7
import Foundation

@MainActor @Suite("PersistentBook Model Tests")
struct PersistentBookTests {
    
    @Test("PersistentBook init with just title")
    func persistentBookInit() {
        // Arrange
        let title = "Test Title"
        // Act
        let book = PersistentBook(title: title)
        // Assertion
        // Run asserts on book
        #expect(book.title == title)
        #expect(book.author == "")
        #expect(book.summary == "")
        #expect(book.rating == 0)
        #expect(book.review == "")
        #expect(book.isFavorite == false)
        #expect(book.genre == .unknown )
        #expect(book.readingStatus == .unknown)
        #expect(book.coverData == nil)
        
    }
    @Test("PersistentBook init with all properties")
    func persistentBookInitAll() {
        // Arrange
        let title = "Test title"
        let author = "Test author"
        let summary = "Test summary"
        let coverData = Data((0...1024).description.utf8)
        let rating: Int = 4
        let review = "Test review"
        let isFavorite: Bool = true
        let genre: Genre = .fantasy
        let readingStatus: ReadingStatus = .finished
        
        // Act
        let book = PersistentBook(
            title: title,
            author: author,
            summary: summary,
            coverData: Data((0...1024).description.utf8),
            rating: rating,
            review: review,
            isFavorite: isFavorite,
            genre: genre,
            readingStatus: readingStatus,
            
            
        )
        // Assertion(s)
        #expect(book.title == title)
        #expect(book.author == author)
        #expect(book.summary == summary)
        #expect(book.rating == rating)
        #expect(book.isFavorite == isFavorite)
        #expect(book.genre == genre)
        #expect(book.readingStatus == readingStatus)
        #expect(book.coverData == nil)
    }
}
