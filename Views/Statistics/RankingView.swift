//
//  RankingView.swift
//  MyFirstApp
//
//  Created by Florian Mainnemard on 09/02/2021.
//

import SwiftUI

struct RankingView: View {
    
    @FetchRequest(
        entity: HabitEntity.entity(),
                      sortDescriptors: [
                        NSSortDescriptor(keyPath: \HabitEntity.name, ascending: true )
                      ]
        ) var habits: FetchedResults<HabitEntity>
    
    
    
    var body: some View {
        HStack(alignment: .bottom) {
            let habit = rankedHabits()
            PodiumStep(habit: habit[1], rank: .second)
            PodiumStep(habit: habit[0], rank: .first)
            PodiumStep(habit: habit[2], rank: .third)
            
        }
        
    }
    // rankedHabit est une closure
    private func rankedHabits() -> [HabitEntity] {
        let sortedHabits = habits.sorted { $0.totalMinutesSpent() > $1.totalMinutesSpent()}
       
        
        
        return Array(sortedHabits.prefix(upTo: 3 ))
    }
    
}



private struct PodiumStep:  View {
    
    @ObservedObject var habit : HabitEntity
    let rank: Rank
    
    var body: some View {
        VStack {
            Text(habit.name)
                .font(.system(size: 18))
                .fontWeight(.semibold)
            Text("\(habit.totalMinutesSpent()) min")
                .font(.footnote)
                .fontWeight(.light)
            ZStack{
                Rectangle()
                    .frame(height: 30 + CGFloat((3 - rank.rawValue) * 20 ))
                    .foregroundColor(Color(white: 0.9))
                    .cornerRadius(5)
                switch rank {
                case .first:
                    Text("🥇")
                case .second:
                    Text("🥈")
                case .third:
                    Text("🥉")
                    }
            }.font(.system(size: 28))            }
        }
    }
    
    private enum Rank: Int {
        case first = 1
        case second = 2
        case third = 3
    }



struct RankingView_Previews: PreviewProvider {
    

    
    static var previews: some View {
        RankingView()
    }
}
