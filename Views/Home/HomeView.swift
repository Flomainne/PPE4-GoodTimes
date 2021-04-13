//
//  HomeView.swift
//  MyFirstApp
//
//  Created by Florian Mainnemard on 13/12/2020.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var habitLibrary: HabitLibrary
    @State private var isShowingHabitCreation = false
    @State private var isShowingFavouriteOnly = false
    
    @FetchRequest(entity: HabitEntity.entity(),
                  sortDescriptors: [
                    NSSortDescriptor(keyPath: \HabitEntity.name, ascending: true )
                  ]
    ) var habits: FetchedResults<HabitEntity>

    
    
    
    
    var body: some View {
    
    ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
         NavigationView{
            ScrollView {
                VStack {
                    ForEach (habits){ habitEntity in
                    if habitEntity.isFavourite || !isShowingFavouriteOnly {
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 16, style: .continuous)
                                .fill(Color.white)
                                .shadow(color: Color(Color.RGBColorSpace.sRGB, white: 0, opacity: 0.2), radius: 4)
                            NavigationLink(
                                    destination: habitDetailView(habitEntity: habitEntity),
                                label: {
                                    HabitCellView(habitEntity: habitEntity)
                                        .foregroundColor(.black)
                                })
                            
                            
                            }
                    }
                   
                    }
                }.padding(.horizontal, 16)
                .animation(.default)
            }
            .navigationTitle(Text("Mes Habitudes"))
            .navigationBarItems(trailing: Toggle(isOn: $isShowingFavouriteOnly, label: {
                Text("Filtre habitudes favorites ❤️")
            }))
        }
        PlusButtonView(action: {
            isShowingHabitCreation.toggle()
        }).sheet(isPresented: $isShowingHabitCreation, content: {
            HabitCreationView(habitLibrary: habitLibrary)
        })
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    
    @StateObject static var habitLibrary = HabitLibrary()
    

    static var previews: some View {
        HomeView(habitLibrary: habitLibrary)
        }
    }
}
