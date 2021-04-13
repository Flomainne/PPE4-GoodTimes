//
//  HabitDescriptionView.swift
//  MyFirstApp
//
//  Created by Florian Mainnemard on 26/01/2021.
//

import SwiftUI

struct HabitDescriptionView: View {
    let description: String?
    let minutes: Int
    
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 8){
                if let description = description {
                    Text(description)
                }
                
                    
                Text("Temps total : \(minutes) min")
                    .fontWeight(.semibold)
                
            }.foregroundColor(.secondary)
            Spacer()
        }
    }
    
}

struct HabitDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HabitDescriptionView(description: "Ceci est une description", minutes: 50)
            HabitDescriptionView(description: "Ceci est une description", minutes: 50)
        }.previewLayout(.sizeThatFits)
    }
}
