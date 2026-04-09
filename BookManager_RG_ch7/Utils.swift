//
//  Utils.swift
//  BookManager_RG_ch7
//
//  Created by Reginald Grant on 4/7/26.
//


func filterFavoriteBooks(
    book:[Book],
    genre:Genre? = nil,
    readingStatus: ReadingStatus? = nil
)->[Book]{
    
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
