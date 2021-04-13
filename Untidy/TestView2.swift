//
//  TestView2.swift
//  MyFirstApp
//
//  Created by Florian Mainnemard on 05/01/2021.
//

import SwiftUI

struct TestView2: View {
    
    @State var ColorisSelected: Bool = true
    
    
    var body: some View {
        VStack{
            Text(ColorisSelected ? "La vue est selectionnée " :  "La vue n'est selectionnée ")
            ColorView(isSelected: $ColorisSelected)
        }
       
    }
}



struct ColorView: View {
    
    @Binding var isSelected: Bool
    
    var body: some View{
        ZStack{
            Circle()
                .foregroundColor(.red)
                .frame(width: 50, height: 50)
            if isSelected{
                Circle()
                    .strokeBorder(Color.gray, lineWidth: 3)
                    .frame(width: 60, height: 60)
            }
        }
    }
}

struct TestView2_Previews: PreviewProvider {
    
    static var previews: some View {
        TestView2()
        
    }
}
