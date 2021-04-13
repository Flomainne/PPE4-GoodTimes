//
//  Data.swift
//  MyFirstApp
//
//  Created by Florian Mainnemard on 01/01/2021.
//

import Foundation

class HabitLibrary: ObservableObject{
    
    @Published var testHabits = [
        Habit(imageURL: URL(string:"https://images.pexels.com/photos/40751/running-runner-long-distance-fitness-40751.jpeg?cs=srgb&dl=pexels-pixabay-40751.jpg&fm=jpg"), name: "Running", isFavourite: false, description:"Exemple description..."),
        Habit(imageURL:
                URL(string:"https://images.pexels.com/photos/276452/pexels-photo-276452.jpeg?cs=srgb&dl=pexels-pixabay-276452.jpg&fm=jpg"), name: "Coding", isFavourite: true, description: "Exemple description..."),
        Habit(imageURL:
                URL(string:"https://images.pexels.com/photos/4156284/pexels-photo-4156284.jpeg?cs=srgb&dl=pexels-cottonbro-4156284.jpg&fm=jpg"), name: "Reading", isFavourite: false, description: "Exemple description...")
    ]
    
}






// Image libre de droit, trouvées sur le site pexels, photo environ 6000x4000, bien selectionner "l'URL de l'image"
let listOfURLs = [
    URL(string: "https://images.pexels.com/photos/3768127/pexels-photo-3768127.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"),//Reading
    URL(string: "https://images.pexels.com/photos/693859/pexels-photo-693859.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"),//coding
    URL(string: "https://images.pexels.com/photos/3756165/pexels-photo-3756165.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"),//running
    URL(string: "https://images.pexels.com/photos/4974914/pexels-photo-4974914.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"), //Working
    URL(string: "https://images.pexels.com/photos/5706277/pexels-photo-5706277.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"), //Shopping
    URL(string: "https://images.pexels.com/photos/357737/pexels-photo-357737.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"), //coooking
    URL(string: "https://images.pexels.com/photos/3944091/pexels-photo-3944091.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"), //Music
    URL(string: "https://images.pexels.com/photos/5094496/pexels-photo-5094496.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260") // Walking
    
]
