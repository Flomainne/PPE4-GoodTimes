//
//  CoverSelectionView.swift
//  MyFirstApp
//
//  Created by Florian Mainnemard on 13/01/2021.
//

import SwiftUI
import Kingfisher

struct CoverSelectionView: View {
    
    @Binding var selectedURL: URL?
    
    private let urls = listOfURLs
    
    private let layout = [
        GridItem(.flexible(), spacing: 2),
        GridItem(.flexible(), spacing: 2)
    ]
    var body: some View {
        LazyVGrid(columns: layout, spacing: 2) {
            ForEach(urls, id: \.self) { url in
                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)){

                    KFImage(url)
                        .resizable()
                        .aspectRatio( contentMode: .fill)
                        .clipped()
                        .onTapGesture(perform:  {
                            selectedURL = url
                        })
                    
                    if url == selectedURL {
                        Rectangle()
                            .foregroundColor(.clear)
                            .border(Color.blue, width: 3)
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.blue)
                            .font(.system(size: 22))
                            .padding()
                    }
                    
                }
            }
            
        }
    }
}

struct CoverSelectionView_Previews: PreviewProvider {
    
    @State static var selectiedURL: URL? = nil
    static var previews: some View {
        CoverSelectionView(selectedURL: $selectiedURL)
    }
}
