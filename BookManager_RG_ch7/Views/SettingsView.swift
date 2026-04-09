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
            }
        }
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.inline)
    }
}
