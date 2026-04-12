//
//  ImageField.swift
//  BookManager_RG_ch7
//
//  Created by Reginald Grant on 4/12/26.
//

import SwiftUI
import PhotosUI

struct ImageField: View {
    @Binding var data: Data?
    
    @State private var photosPickerItem: PhotosPickerItem?
    private var imagePreview: UIImage {
        if let data {
            UIImage(data: data)!
        } else {
            UIImage(resource: .bookIcon)
            
        }
    }
    
    var body: some View {
        PhotosPicker(
            selection: $photosPickerItem,
            matching: .images,
            photoLibrary: .shared(),
        ){
            Image(uiImage: imagePreview)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width:100, height:100)
        }.onChange(of: photosPickerItem) {
            Task{
                if let photosPickerItem,
                    let imageData = try? await photosPickerItem.loadTransferable(type: Data.self) {
                        data = imageData
                    }
                }
            }
        }
    }

