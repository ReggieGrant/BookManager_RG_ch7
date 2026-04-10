//
//  SettingsView.swift
//  BookManager_RG_ch7
//
//  Created by Reginald Grant on 4/8/26.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("SETTINGS_GRID_COLUMNS_KEY") private var gridColumns: Int = 2
    @AppStorage("SETTINGS_APPERANCE_THEME_KEY") private var theme: Theme = .system
    @AppStorage("SETTINGS_FONT_SIZE_KEY") private var fontSize: Double = 16.0
    @AppStorage("SETTINGS_SHOW_RATING_KEY") var showRatings: Bool = true
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Apperance")){
                    Picker("Theme", selection: $theme){
                        ForEach(Theme.allCases, id:\.self){ theme in
                            Text(theme.rawValue).tag(theme)
                            
                        }
                    }
                }
                Section(header: Text("Grid")){
                    Stepper("Columns: \(gridColumns)", value: $gridColumns,
                            in: 1...4)
                }
                Section(header: Text("Font Size")){
                    Text("Font Size: \(Int(fontSize))")
                    Slider(value: $fontSize, in: 12...24, step: 1)
                    
                }
                Section(header: Text("Show Ratings")){
                    Toggle("Ratings", isOn: $showRatings)
                }
            }
        }
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.inline)
    }
}
