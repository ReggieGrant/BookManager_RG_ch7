//
//  Utils.swift
//  BookManager_RG_ch7
//
//  Created by Reginald Grant on 4/7/26.
//


func filterFavoriteBooks(book:[Book])->[Book]{
    
    return book.filter{
        $0.isFavorite
    }
}
