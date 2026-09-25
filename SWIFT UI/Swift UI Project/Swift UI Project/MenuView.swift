//
//  MenuView.swift
//  Swift UI Project
//
//  Created by Jose Manuel Garcia Chavez on 25/09/26.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationStack{
//            VStack{
//                NavigationLink( destination: IMCView()){
//                    Text("Title App")
//                }
//                Text("Title 1")
//                Text("Title 2")
//                Text("Title 3")
//                Text("Title 4")
//                Text("Title 5")
//            }
            List{
                NavigationLink( destination: IMCView()){
                    Text("Title App")
                }
                NavigationLink( destination: SuperHeroSearcher()){
                    Text("SuperHeroSearcher")
                }
                
                Text("Title 2")
                Text("Title 3")
                Text("Title 4")
                Text("Title 5")
            }
        }
    }
}

#Preview {
    MenuView()
}
