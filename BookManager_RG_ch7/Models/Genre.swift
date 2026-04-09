//
//  Genre.swift
//  BookManager_RG_ch7
//
//  Created by Reginald Grant on 4/8/26.
//

enum Genre: String, CaseIterable {
    case fantasy = "Fantasy"
    case horror = "Horror"
    case romance = "Romance"
    case mystery = "Mystery"
    case sciFi = "Science Fiction"
    case thriller = "Thriller"
    // Base case
    case unknown = "Unknown"
}
