//
//  ContentView.swift
//  BookManager_RG_ch7
//
//  Created by Reginald Grant on 3/24/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
   

    
    @AppStorage("SETTINGS_APPERANCE_THEME_KEY") private var theme: Theme = .system
    @AppStorage("SETTINGS_FONT_SIZE_KEY") private var fontSize: Double = 16.0
    
    private var currentTheme: ColorScheme? {
        switch theme {
        case .system:
            return nil
        case .light:
            return .light
        case .dark:
            return .dark
        }
    }

    var body: some View {
        
        TabView{
            BookListView()
                .tabItem{
                    Label("Books", systemImage: "books.vertical.fill")
                }
            FavoriteView()
                .tabItem{
                    Label("Favorites", systemImage: "heart.fill")
                }
            SettingsView()
                .tabItem{
                    Label("Settings", systemImage: "gearshape")
                }
        }
        .preferredColorScheme(currentTheme)
        .font(.system(size: fontSize))
    }
    
}
    


    


//#Preview {
//    var modelContainer: ModelContainer = try! ModelContainer(
//        for: PersistentBook.self,
//        configurations:ModelConfiguration(isStoredInMemoryOnly: true)
//    )
//    let mockBook = PersistentBook(title: "Title of thr book")
//    modelContainer.mainContext
//    
//    ContentView()
//        .modelContainer(modelContainer)
//        
//}
//
//func addMockBook(book:PersistentBook)
