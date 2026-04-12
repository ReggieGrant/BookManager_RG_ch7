//
//  BookDetailView.swift
//  BookManager_RG_ch7
//
//  Created by Reginald Grant on 3/24/26.
//

import SwiftUI
import SwiftData

struct BookDetailView: View {
    
    
    var book: PersistentBook
    @State private var isFavorite: Bool
    
    @State private var showEditBookSheet: Bool = false
    @Environment(\.modelContext) private var modelContext
    
    init(book: PersistentBook) {
        self.book = book
        self.isFavorite = book.isFavorite
    }
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading){
                HStack{
                    Image(uiImage:book.cover)
                        .resizable()
                        .scaledToFit()
                        .frame(width:100, height: 150)
                    
                    VStack{
                        Text(book.title)
                            .font(.largeTitle.bold())
                        if(!book.author.isEmpty){
                            Text("by: \(book.author)")
                                .font(.headline)
                                .foregroundColor(.secondary)
                        }
                        ColoredCapsule(text:book.genre.rawValue)
//                        Text("Genre: \(book.genre.rawValue)")
//                            .font(.subheadline)
//                            .foregroundColor(.secondary)
                    }
                    HStack{
                        Spacer()
                        FavoriteToggle(isFavorite: $isFavorite)
                            .onChange(of: isFavorite) {
                                book.isFavorite = isFavorite
                                try? modelContext.save()
                            }
                    }
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.bottom)
                Text(book.summary)
                    .font(.subheadline)
                HStack{
                    Text("My Review")
                        .font(.title2)
                    Spacer()
                    ColoredCapsule(
                        text:book.readingStatus.rawValue,
                        color:.orange
                    )
                }.padding(.bottom)
                StarRatingView(rating: book.rating)
                Text(book.review)
                    .padding(8)
                Spacer()
            }
            
            
        }
        .padding()
        .navigationTitle("Book Details")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing: Button("Edit"){
            showEditBookSheet.toggle()
        })
        .sheet(isPresented: $showEditBookSheet,
               content:{
            AddEditView(book: book, modelContext: modelContext)
        }
        )
    }
}

//#Preview {
//    BookDetailView(
//        book: Book(
//            title: "Sample Book",
//            author: "Sample Author",
//            summary: "Sample summary"
//        )
//    )
//}
