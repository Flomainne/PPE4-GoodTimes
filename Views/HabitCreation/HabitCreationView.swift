//
//  HabitCreationView.swift
//  MyFirstApp
//
//  Created by Florian Mainnemard on 12/01/2021.
//

import SwiftUI

struct HabitCreationView: View {
    @ObservedObject var habitLibrary: HabitLibrary
    @State var habitConfig = NewHabitConfig()
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
          NavigationView{
             ScrollView {
                    VStack {
                        TextField("Nom de l'habitude", text: $habitConfig.name)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        TextEditor(text: $habitConfig.description)
                            .border(Color.gray, width: 1)
                            .frame(height: 150)
                    }.padding()
                CoverSelectionView(selectedURL: $habitConfig.imageURL)
            }.navigationTitle("Créer une habitude")
            .navigationBarItems(trailing: Button (action:{
                
                let newHabit = HabitEntity(context: viewContext)
                newHabit.id = UUID()
                newHabit.name = habitConfig.name
                newHabit.stringDescription = habitConfig.description
                newHabit.imageURL = habitConfig.imageURL
                newHabit.isFavourite = false
                
                do {
                    try viewContext.save()
                }catch {
                    print("Erreur lors de l'enregistrement")
                }
                
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Valider")
            }))
            }
        }
    }


struct HabitCreationView_Previews: PreviewProvider {
    
    @StateObject static var habitLibrary = HabitLibrary()
    static var previews: some View {
    
        HabitCreationView(habitLibrary: habitLibrary)
    }
}
