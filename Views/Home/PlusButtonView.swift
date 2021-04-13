//
//  PlusButtonView.swift
//  MyFirstApp
//
//  Created by Florian Mainnemard on 05/01/2021.
//

import SwiftUI

struct PlusButtonView: View {
    
    let action: () -> Void
     
    var body: some View {
        Button(action: action, label: {
        ZStack {
            Circle()
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .frame(width: 70, height: 70)
            Image(systemName: "plus")
                .foregroundColor(.white)
                .font(.system(size: 24, weight: .semibold))
            }.shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        })
            
        
    }
}

struct PlusButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PlusButtonView(action: {} )
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
