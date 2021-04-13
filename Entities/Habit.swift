//
//  Habit.swift
//  MyFirstApp
//
//  Created by Florian Mainnemard on 01/01/2021.
//

import Foundation

class Habit: Identifiable, ObservableObject {
    let id = UUID().uuidString
    @Published var imageURL: URL?
    @Published var name: String
    var totalTime: Int {
        var sum = 0
        for slot in timeSlots {
            sum += slot.minutes
        }
        return sum
    }
    @Published var isFavourite: Bool
    @Published var descritpiton: String
    @Published var timeSlots: [SpentTime]
    
    
    init(imageURL: URL?, name: String, isFavourite: Bool, description: String){
        self.imageURL = imageURL
        self.name = name
        self.isFavourite = isFavourite
        self.descritpiton = description
        self.timeSlots = []
    }
    
//    init(habitEntity:HabitEntity){
//        self.imageURL = habitEntity.imageURL
//        self.name = habitEntity.name
//        self.isFavorite = habitEntity.isFavourite
//        self.descritpiton = habitEntity.description
//        self.timeSlots = []
//    }
    
    init(config: NewHabitConfig) {
        self.imageURL = config.imageURL
        self.name = config.name
        self.descritpiton = config.description
        self.isFavourite = false
        self.timeSlots = []
    }
    
}
