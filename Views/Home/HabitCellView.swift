//
//  HabitCellView.swift
//  MyFirstApp
//
//  Created by Florian Mainnemard on 01/01/2021.
//

import SwiftUI
import Kingfisher

struct HabitCellView: View {
    
   @ObservedObject var habitEntity: HabitEntity
    
    var body: some View {
        HStack {
            KFImage(habitEntity.imageURL)
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .frame(width: 80, height: 80)
                .clipped()
                .cornerRadius(10)
                .padding(.trailing)
            VStack(alignment: .leading){
                Text(habitEntity.name)
                    .font(.system(.title2))
                    .fontWeight(.semibold)
                Text("Total:  \(habitEntity.totalMinutesSpent()) minute")
                }
            Spacer()
            FavouriteButtonView(onColor: .red, offColor: .gray, isLiked: $habitEntity.isFavourite)
            }.padding()
    }
}

struct HabitCellView_Previews: PreviewProvider {
    
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
        HabitCellView(habitEntity: habitEntity)
            .previewLayout(.sizeThatFits)
    }
}
