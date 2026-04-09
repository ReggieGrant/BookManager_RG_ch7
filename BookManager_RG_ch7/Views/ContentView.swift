//
//  ContentView.swift
//  BookManager_RG_ch7
//
//  Created by Reginald Grant on 3/24/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
   
    @State private var books = getBooks()
    
    @AppStorage("SETTINGS_APPERANCE_THEME_KEY") private var theme: Theme = .system
    
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
            BookListView(books:$books)
                .tabItem{
                    Label("Books", systemImage: "books.vertical.fill")
                }
            FavoriteView(books: $books)
                .tabItem{
                    Label("Favorites", systemImage: "heart.fill")
                }
            SettingsView()
                .tabItem{
                    Label("Settings", systemImage: "gearshape")
                }
        }
        .preferredColorScheme(currentTheme)
                
    }
    
}
    


    


#Preview {
    ContentView()
        
}
