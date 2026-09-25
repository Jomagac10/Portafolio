//
//  ButtonExample.swift
//  Swift UI Project
//
//  Created by Jose Manuel Garcia Chavez on 27/04/26.
//

import SwiftUI

struct ButtonExample: View {
    var body: some View {
        Button("Hello"){
            print("Hola")
        }
        Spacer()
        Button {
            print("Hola")
        } label: {
            LabelExample()
        }
        Spacer()
        Button {
            print("Hola abajo")
        } label: {
            Text("Hola").foregroundStyle(.white).frame(width: 100, height: 50).background(.red).cornerRadius(10)
        }

    }
}

struct Counter: View {
    @State var numbers: Int = 0
    var body: some View {
        Button {
            numbers += 1
        } label: {
            ZStack{
                Text("Contador: \(numbers)").padding(EdgeInsets(top: 10, leading: 20, bottom: 30, trailing: 40)).foregroundStyle(.white).frame(height: 50).background(.red).cornerRadius(10).font(.title)
            }
            
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 150, height: 50)
                Text("Confirmar")
                    .fontWeight(.bold)
            }
        }
    }
}

#Preview {
    ButtonExample()
}

#Preview {
    Counter()
}
