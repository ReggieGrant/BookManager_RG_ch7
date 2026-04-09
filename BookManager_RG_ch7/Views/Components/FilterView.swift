//
//  FilterView.swift
//  BookManager_RG_ch7
//
//  Created by Reginald Grant on 4/8/26.
//

import SwiftUI

struct FilterView: View {
    
    @Binding var selectedGenre: Genre?
    @Binding var selectedReadingStatus: ReadingStatus?
    
    var body: some View {
        
        Form{
            Section(header:Text("Select a genre")){
                Picker("Genre",selection: $selectedGenre){
                    Text("No genre selected").tag(nil as Genre?)
                    ForEach(Genre.allCases, id:\.self){ genre in
                        Text(genre.rawValue).tag(genre)
                        
                    }
                    
                }
                            
                        }
            
            Section(header:Text("Select reading status")){
                Picker("Reading Status",selection: $selectedReadingStatus){
                    Text("No status selected").tag(nil as ReadingStatus?)
                    ForEach(ReadingStatus.allCases, id:\.self){ readingStatus in
                        Text(readingStatus.rawValue).tag(readingStatus)
                    }
                }
            }
        }
        .toolbar{
            ToolbarItem(placement: .cancellationAction){
                Button("Clear"){
                    self.selectedGenre = nil
                    self.selectedReadingStatus = nil
                }
            }
        }
//        .navigationTitle("Apply Filters")
//        .navigationBarTitleDisplayMode(.inline)
//        .navigationBarItems(trailing: Button("Clear"){
//            self.selectedGenre = nil
//            self.selectedReadingStatus = nil
//        })
    }
}
