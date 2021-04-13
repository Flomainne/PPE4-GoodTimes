//
//  FavouriteButtonView.swift
//  MyFirstApp
//
//  Created by Florian Mainnemard on 15/12/2020.
//

import SwiftUI

struct FavouriteButtonView: View {
    // couleurs associées à un état
    let onColor: Color
    let offColor: Color
    
   @Binding var isLiked: Bool
    
    var body: some View {
        Button(action: {
            toggle()
        }, label: {
            //change l'appararence coeur rempli ou non
            Image(systemName: isLiked ? "heart.fill" : "heart")
                .font(.system(size: 24))
                .padding(10)
                .foregroundColor(isLiked ? onColor : offColor)
            
        })
        
    }
    
    private func toggle(){
        isLiked.toggle()
    }
}
struct FavouriteButtonView_Previews: PreviewProvider {
    
    @State static var isLiked = true
    @State static var isNotLiked = false
    
    static var previews: some View {
        Group {
            FavouriteButtonView(onColor: .red, offColor: .gray,isLiked: $isLiked)
            FavouriteButtonView(onColor: .red, offColor: .gray, isLiked: $isNotLiked)
        }.previewLayout(.sizeThatFits)
        
    }
}
