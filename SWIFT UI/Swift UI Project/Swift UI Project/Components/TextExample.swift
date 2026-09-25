//
//  TextExample.swift
//  Swift UI Project
//
//  Created by Jose Manuel Garcia Chavez on 25/04/26.
//

import SwiftUI

struct TextExample: View {
    var body: some View {
        VStack{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/).font(.headline)
            Text("Hello, World!").font(.system(size: 30, weight: .bold, design: .monospaced))
            Text("Hello, World!").lineLimit(2).lineSpacing(10).frame(width: 50)
        }
    }
}

#Preview {
    TextExample()
}
