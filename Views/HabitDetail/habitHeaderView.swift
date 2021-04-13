//
//  habitHeaderView.swift
//  MyFirstApp
//
//  Created by Florian Mainnemard on 26/01/2021.
//

import SwiftUI
import Kingfisher

struct habitHeaderView: View {
    
    @ObservedObject var habitEntity: HabitEntity
    var body: some View {
        ZStack(alignment: .bottom){
        
            KFImage(habitEntity.imageURL)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height:200)
                .clipped()
            
            LinearGradient(
                gradient: Gradient(
                    colors: [Color(white: 0, opacity: 0.5), .clear]), startPoint: .bottom, endPoint: .top).frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            HStack{
                Text(habitEntity.name)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                Spacer()
                FavouriteButtonView(onColor: .red, offColor: .white, isLiked: $habitEntity.isFavourite)
            }
            
        }
    }
}

struct habitHeaderView_Previews: PreviewProvider {
    
    static private let persistenceController = PersistenceController.preview
    static private let habitEntity: HabitEntity = {
        let habitEntity = HabitEntity(context: persistenceController.container.viewContext)
        habitEntity.id = UUID()
        habitEntity.name = "Habitude Test"
        habitEntity.imageURL = URL(string:"https://images.pexels.com/photos/276452/pexels-photo-276452.jpeg?cs=srgb&dl=pexels-pixabay-276452.jpg&fm=jpg")
        habitEntity.stringDescription = "La description"
        habitEntity.isFavourite = false
        return habitEntity
    }()
    
    
    
    static var previews: some View {
        habitHeaderView(habitEntity: habitEntity)
    }
}
