//
//  SpentTime.swift
//  MyFirstApp
//
//  Created by Florian Mainnemard on 26/01/2021.
//

import Foundation

struct SpentTime: Identifiable {
    let id = UUID().uuidString
    let date: Date
    let minutes: Int
}
