//
//  Book
//  BookManager_RG_ch7
//
//  Created by Reginald Grant on 3/24/26.
//

import Foundation

struct Book: Identifiable{
    var id: UUID = UUID()
    var title: String
    var author: String
    var summary: String
    var cover: String
    
    var rating: Int = 0
    var review: String = ""
    
    var isFavorite: Bool = false
    
    // Genre
    var genre: Genre = .unknown
    // Reading status
    var readingStatus: ReadingStatus = .unknown
    
    
}
