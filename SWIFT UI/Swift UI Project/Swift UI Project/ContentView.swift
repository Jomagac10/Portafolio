//
//  ContentView.swift
//  Swift UI Project
//
//  Created by Jose Manuel Garcia Chavez on 25/09/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint).padding()
            
//            Spacer().frame(height: 10)
//                .frame(maxWidth: .infinity).background(.gray)
            
            ZStack{
                Text("")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.green)
                    .padding(2)
                Text("")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.gray)
                    .padding(20)
                Text("")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.blue)
                    .padding(40)
                Text("")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.white)
                    .padding(60)
            }
            
            HStack(alignment: .center){
                Text("Hello, world!!")
                Spacer()
                Text("Hello, world2!!")
                    .foregroundStyle(.blue)
                Spacer()
                Text("Hello, world3!!").background(.red)
                    .foregroundStyle(.white)
            }
            
            Text("Hello, world4!!").bold().foregroundStyle(.white)
            
//            Spacer().frame(maxWidth: .infinity)
        }.background(.yellow).safeAreaPadding()
    }
}

#Preview {
    ContentView()
}
