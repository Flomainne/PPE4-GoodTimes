//
//  StatisticsHabitView.swift
//  MyFirstApp
//
//  Created by Florian Mainnemard on 02/02/2021.
//

import SwiftUI

struct StatisticsHabitView: View {
    @ObservedObject var habitEntity:HabitEntity
    
    var body: some View {
        VStack{
            Spacer()
            HStack(alignment: .bottom){
                ForEach(lasWeekCalendar(), id: \.self) { day in
                    let height = lasWeekStatistics()[day]!
                    BarChart(height: CGFloat(height))
                }
            }
            Rectangle()
                .frame(height:0.5)
                .foregroundColor(.gray)
            HStack{
                ForEach(lasWeekCalendar(), id: \.self) { day in
                    DayLabelView(day: day)
                }
            }
        }
    }
    
    private func lasWeekCalendar() ->[String]{
        var lastWeekCalendar = [String]()
        let calendar = Calendar.current
        let formatter = DateFormatter()
        formatter.dateFormat = "E"
        
        for index in 0..<7{
            let newDay = calendar.date(byAdding: .day, value: -index, to: Date())!
            lastWeekCalendar.append(formatter.string(from: newDay))
        }
        
        return lastWeekCalendar.reversed()
    }
    
    private func lasWeekSlots() -> [SpentTimeEntity]{
        let calendar = Calendar.current
        let weekAgo = calendar.date(byAdding: .day, value: -7, to: Date())!
        var slots = [SpentTimeEntity]()
        
        
        guard let timeSlots = habitEntity.timeSlots else { return [] }
        for slot in Array (timeSlots) as! [SpentTimeEntity]  {
            if slot.date > weekAgo {
                slots.append(slot)
            }
        }
        
        return slots
    }
    
    private func lasWeekStatistics() -> [String: Int]{
        var statistics = [String: Int]()
        let slots = lasWeekSlots()
        let formatter = DateFormatter()
        formatter.dateFormat = "E"
        
        for day in lasWeekCalendar(){
            statistics[day] = 0
            for slot in slots {
                if formatter.string(from: slot.date) == day{
                    statistics[day]! += Int(slot.minutes)
                }
            }
        }
        
        
        return statistics
    }
}

private struct DayLabelView : View {
    
    let day: String
    
    var body : some View {
        HStack{
            Spacer()
            Text(day)
            Spacer()
        }
    }
}

private struct BarChart: View {
    
    var height: CGFloat
    var body: some View{
        
        HStack{
            Spacer()
            Rectangle()
                .frame(width: 30, height: max(height, 10))
                .foregroundColor(.blue)
                .cornerRadius(5)
            Spacer()
        }
        }
    }


struct StatisticsHabitView_Previews: PreviewProvider {
    
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
        StatisticsHabitView(habitEntity: habitEntity)
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
