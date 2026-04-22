//
//  Utils.test.swift
//  BookManager_RG_ch7
//
//  Created by Reginald Grant on 4/22/26.
//

import Testing
@testable import BookManager_RG_ch7

@MainActor @Suite
struct utilsTest {
    
    // test only sending books -> all my favortie books
    @Test
    func filterFavoriteBooksOnly() {
        // arrange
        let books: [PersistentBook] = [
            PersistentBook(title:"Book 1", isFavorite:true),
            PersistentBook(title:"Book 2"),
            PersistentBook(title:"Book 3", isFavorite:true),
            PersistentBook(title:"Book 4")
        ]
        // act
        let filteredBooks = filterFavoriteBooks(book: books)
        
        // assert
        #expect(filteredBooks.count == 2)
        #expect(filteredBooks[0].title == "Book 1")
        #expect(filteredBooks[1].title == "Book 3")
    }
    
    //test books and genre -> all my books with that genre
    @Test
    func filterFavoriteBooksWithGenre() {
        
        let books: [PersistentBook] = [
            PersistentBook(title:"Book 1", isFavorite:true, genre:.fantasy),
            PersistentBook(title:"Book 2", isFavorite:true, genre:.mystery),
            PersistentBook(title:"Book 3", isFavorite:true),
            PersistentBook(title:"Book 4", genre: .mystery)
        ]
        // act
        let filteredBooks = filterFavoriteBooks(book: books, genre:.mystery)
        
        // assert
        #expect(filteredBooks.count == 1)
        #expect(filteredBooks[0].title == "Book 2")
        
    }
    // test book and readingStatus -> all my books with that readingStatus
    
    @Test
    func filterFavoriteBooksWithStatus() {
        
        let books: [PersistentBook] = [
            PersistentBook(title:"Book 1", isFavorite:true, readingStatus:.dropped),
            PersistentBook(title:"Book 2", isFavorite:true, readingStatus:.planToRead),
            PersistentBook(title:"Book 3", isFavorite:true),
            PersistentBook(title:"Book 4", readingStatus: .planToRead)
        ]
        // act
        let filteredBooks = filterFavoriteBooks(book: books, readingStatus:.planToRead)
        
        // assert
        #expect(filteredBooks.count == 1)
        #expect(filteredBooks[0].title == "Book 2")
        
    }
    // test book, genre and readingStatus -> all my favorite books with that genre and that readingStatus
    
    @Test
    func filterFavoriteBooksWithGenreAndStatus() {
        
        let books: [PersistentBook] = [
            PersistentBook(title:"Book 1", isFavorite:true, genre:.mystery, readingStatus:.dropped),
            PersistentBook(title:"Book 2", isFavorite:true, genre:.mystery, readingStatus:.planToRead),
            PersistentBook(title:"Book 3", isFavorite:true,genre:.fantasy, readingStatus: .planToRead),
            PersistentBook(title:"Book 4", isFavorite:true),
            PersistentBook(title:"Book 5", genre:.mystery, readingStatus: .planToRead)
        ]
        // act
        let filteredBooks = filterFavoriteBooks(book: books, genre: .mystery, readingStatus:.planToRead)
        
        // assert
        #expect(filteredBooks.count == 1)
        #expect(filteredBooks[0].title == "Book 2")
        
    }}
