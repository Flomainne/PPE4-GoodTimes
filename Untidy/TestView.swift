//
//  TestView.swift
//  MyFirstApp
//
//  Created by Florian Mainnemard on 30/12/2020.
//

/** Balises pour réaliser des commentaires */


import SwiftUI

let sections:[MenuSection] = [
    MenuSection(name: "Voyage", items: [
        MenuItem(name: "Passport"),
        MenuItem(name: "Brosse à dent "),
        MenuItem(name: "Tee shirt")
    ]),
    
    MenuSection(name: "Nourriture", items: [
        MenuItem(name: "Pain"),
        MenuItem(name: "Fruit "),
        MenuItem(name: "Couverts")
    ])
]


// Créer un tableau et le parcourir et l'afficher en liste
struct TestView: View {
    let items = [
    MenuItem(name: "Passport"),
    MenuItem(name: "Brosse à dent "),
    MenuItem(name: "Tee shirt")
    ]
    
    //sumplification de la boucle sans passer de "id"
    var body: some View {
        List {
            ForEach(sections){ section in
                
                Section(header: Text(section.name)){
                    ForEach(section.items){ item in
                        Text(item.name)
                        }
                
                    }
                }
        }.listStyle(GroupedListStyle())
        }
}
 

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}

struct MenuItem: Identifiable {
    var id = UUID().uuidString
    let name:String
}
struct MenuSection: Identifiable {
    let id = UUID().uuidString
    let name:String
    let items:[MenuItem]
}
