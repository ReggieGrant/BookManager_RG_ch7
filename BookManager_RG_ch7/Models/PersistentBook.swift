//
//  PersistentBook.swift
//  BookManager_RG_ch7
//
//  Created by Reginald Grant on 4/12/26.
//

import Foundation
import SwiftData
import UIKit

@Model
class PersistentBook {
    var title: String
    var author: String
    var summary: String
//    var cover: String
    var coverData: Data?
    var rating: Int
    var review: String
    var isFavorite: Bool
    var genre: Genre
    var readingStatus: ReadingStatus
    
    init(
        title: String,
        author: String = "",
        summary: String = "",
        coverData: Data? = nil,
        rating: Int=0,
        review: String="",
        isFavorite: Bool=false,
        genre: Genre = .unknown,
        readingStatus: ReadingStatus = .unknown
    ) {
        self.title = title
        self.author = author
        self.summary = summary
        self.coverData = coverData
        self.rating = rating
        self.review = review
        self.isFavorite = isFavorite
        self.genre = genre
        self.readingStatus = readingStatus
    }
    
    // computed property
    var cover: UIImage {
        if self.coverData != nil {
            UIImage(data: self.coverData!)!
        } else {
            UIImage(resource: .bookIcon)
        }
    }
    
}
