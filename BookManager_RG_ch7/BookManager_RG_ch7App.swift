//
//  BookManager_RG_ch7App.swift
//  BookManager_RG_ch7
//
//  Created by Reginald Grant on 3/24/26.
//

import SwiftUI
import SwiftData

@main
struct BookManager_RG_ch7App: App {
    
    let modelContainer:  ModelContainer
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(modelContainer)
        }
    }
    init(){
        do {
            modelContainer = try ModelContainer(
                for: PersistentBook.self
            )
        } catch {
            fatalError("Failed to load model container")
        }
    }
}

