//
//  Utils.swift
//  BookManager_RG_ch7
//
//  Created by Reginald Grant on 4/7/26.
//


func filterFavoriteBooks(
    book:[PersistentBook],
    genre:Genre? = nil,
    readingStatus: ReadingStatus? = nil
)->[PersistentBook]{
    
    return book.filter{
        $0.isFavorite
        && (
            genre == nil
            || $0.genre == genre
        ) && (
            readingStatus == nil
            || $0.readingStatus == readingStatus
        )
        
    }
}
