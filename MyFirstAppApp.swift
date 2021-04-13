//
//  MyFirstAppApp.swift
//  MyFirstApp
//
//  Created by Florian Mainnemard on 13/12/2020.
//

import SwiftUI

@main
struct MyFirstAppApp: App {
    
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(HabitLibrary())
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
