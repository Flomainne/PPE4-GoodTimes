//
//  TestView3.swift
//  MyFirstApp
//
//  Created by Florian Mainnemard on 12/01/2021.
//

import SwiftUI

struct TestView3: View {
    
    var layout = [
        GridItem(.adaptive(minimum: 100), spacing: 2, alignment: .center)
        
    ]
    
    let symbols = ["heart", "paperplane","pencil","trash", "folder"]
    
    
    var body: some View {
        LazyVGrid(columns: layout){
            ForEach(symbols, id: \.self) { symbol in
                VStack {
                    Image(systemName: symbol)
                        .font(.system(size: 30))
                    Text(symbol)
                }
            }
        }
    }
}

struct TestView3_Previews: PreviewProvider {
    static var previews: some View {
        TestView3()
    }
}
