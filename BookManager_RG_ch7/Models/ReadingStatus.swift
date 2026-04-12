//
//  ReadingStatus.swift
//  BookManager_RG_ch7
//
//  Created by Reginald Grant on 4/8/26.
//

enum ReadingStatus: String, CaseIterable, Codable {
    case planToRead = "Planning to read"
    case reading = "Reading"
    case dropped = "Dropped"
    case finished = "Finished"
    // Base case
    case unknown = "Unknown"
}
