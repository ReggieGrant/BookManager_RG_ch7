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
}
