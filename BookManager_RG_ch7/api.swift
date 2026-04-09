//
//  api.swift
//  BookManager_RG_ch7
//
//  Created by Reginald Grant on 3/24/26.
//

import Foundation

func getBooks() -> [Book] {
    return [
        
            Book(title:"The Fellowship of the Ring",
                 author: "J.R.R Tolkien",
                 summary:"Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.",
                 cover: "lotr_fellowship",
                
//                 isFavorite: true,
//                 genre: .sciFi
                ),
                
            
            
            
            
            Book(title:"The Two Towers",
                 author: "J.R.R Tolkien",
                 summary:"Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.",
                 cover: "lotr_towers"),
            
            Book(title:"The Return of the King",
                 author: "J.R.R Tolkien",
                 summary:"Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.",
                 cover: "lotr_king"),
            
            
            
            ]
}
