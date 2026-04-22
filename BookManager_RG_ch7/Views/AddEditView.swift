//
//  AddEditView.swift
//  BookManager_RG_ch7https://sdgku.instructure.com/courses/2655/modules
//
//  Created by Reginald Grant on 3/24/26.
//

import SwiftUI
import SwiftData

struct AddEditView: View {
    
    @StateObject private var viewModel: AddEditViewModel
    
    @Environment(\.dismiss) var dismiss
    
    
    init(book: PersistentBook? = nil, modelContext: ModelContext){
        _viewModel = StateObject(wrappedValue: AddEditViewModel(
            book: book,
            modelContext: modelContext
        ))
        
    }
    
    var body: some View {
        NavigationStack{
            Form{
                Section(header: Text("Book Details")){
                    TextField("Title Of The Book", text: $viewModel.title)
                    TextField("Author", text: $viewModel.author)
                    TextEditor(text: $viewModel.summary)
                        .frame(height: 150)
                    Picker("Genre",selection: $viewModel.genre){
                        ForEach(Genre.allCases, id:\.self){ genre in
                            Text(genre.rawValue).tag(genre)
                            
                        }
                    }

                    
                }
                Section(header: Text("My Review")){
                    Picker("Reading Status",selection: $viewModel.readingStatus){
                        ForEach(ReadingStatus.allCases, id:\.self){ readingStatus in
                            Text(readingStatus.rawValue).tag(readingStatus)
                            
                        }
                        ImageField(data: $viewModel.coverData)
                    }
                    Picker("Rating", selection: $viewModel.rating){
                        Text("No Rating selected...").tag(0)
                        ForEach(1...5, id: \.self){ num in
                            Text(String(num)).tag(num)
                        }
                    }
                    TextEditor(text: $viewModel.review)
                        .frame(height: 150)
                }
            }
            .navigationTitle(viewModel.navigationTitle)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .confirmationAction){
                    Button("Save"){
                        viewModel.saveBook()
                        dismiss()
                    }.disabled(viewModel.isNotSavable)
                }
            }
        }
    }
}

//#Preview {
//    AddEditView(
//        book: .constant(
//            Book(
//                title: "The Fellowship of the Ring",
//                author: "J.R.R. Tolkien",
//                summary: "A hobbit begins a journey to destroy a powerful ring.",
//                cover: "lotr_fellowship"
//            )
//        )
//    )
//}
