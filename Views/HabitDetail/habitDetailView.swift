//
//  habitDetailView.swift
//  MyFirstApp
//
//  Created by Florian Mainnemard on 26/01/2021.
//

import SwiftUI

struct habitDetailView: View {
    @EnvironmentObject var habitLibrary : HabitLibrary
    @ObservedObject var habitEntity:HabitEntity
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) private var presentationMode
    
    @State private var selectedDate = Date()
    @State private var selectedTime = 30
    @State private var isAddingTime = false
    
    var body: some View {
        ScrollView{
            VStack{
                habitHeaderView(habitEntity: habitEntity)
                HabitDescriptionView(
                    description: habitEntity.stringDescription,
                    minutes: habitEntity.totalMinutesSpent()
                ).padding()
                
                if isAddingTime {
                    TimeConfigurationView(
                        selectedMinutes: $selectedTime,
                        selectedDate: $selectedDate
                    ).padding()
                }
                
              
                StandardButtonView(
                    color: isAddingTime ? .green : .blue,
                    action: {
                    withAnimation{
                        isAddingTime ? addNewTime() : ToggleEditionMode()
                        
                    }
                        
                    }, title: isAddingTime ? "Valider" : "Ajouter du temps")
                    .padding()
                ForEach(habitEntity.spentTimes()){ time in
                    TimeCellView(spentTime: time)
                        .padding()
                    Rectangle()
                        .foregroundColor(.gray)
                        .frame(height: 0.5)
                }
            }
            
            
            
            
            // boutton de suppression : logo poubelle et action
        }.navigationBarItems(trailing: Button(action: {
            viewContext.delete(habitEntity)
            do {
                try viewContext.save()
                self.presentationMode.wrappedValue.dismiss()
            } catch {
                print(error.localizedDescription)
            }
        }, label: { Image(systemName: "trash")
            .foregroundColor(.black)
            .padding()
        }))
    }
    
    
    
    
    
    
    private func addNewTime(){
    habitLibrary.objectWillChange.send()
    
    let newTimeSlot = SpentTimeEntity(context: viewContext)
        newTimeSlot.id = UUID()
        newTimeSlot.date = selectedDate
        newTimeSlot.minutes = Int64(selectedTime)
        habitEntity.addToTimeSlots(newTimeSlot)
        
        do {
            try viewContext.save()
        } catch {
            print("Erreur lors de l'enregistrement")
        }
        ToggleEditionMode()
    }
    private func ToggleEditionMode(){
        isAddingTime.toggle()
    }
}

struct habitDetailView_Previews: PreviewProvider {
    
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
        
        NavigationView {
            habitDetailView(habitEntity: habitEntity)
        }
        
    }
}
