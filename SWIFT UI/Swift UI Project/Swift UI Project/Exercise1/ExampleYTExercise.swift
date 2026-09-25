//
//  ExampleYTExercise.swift
//  Swift UI Project
//
//  Created by Jose Manuel Garcia Chavez on 25/09/26.
//

import SwiftUI

struct ExampleYTExercise : View {
    var body: some View {
        VStack{
            HStack{
                Rectangle().foregroundStyle(.blue)
                Rectangle().foregroundStyle(.orange)
                Rectangle().foregroundStyle(.yellow)
            }
            Rectangle().foregroundStyle(.orange)
            HStack{
                Circle().foregroundStyle(.green)
                Rectangle()
                Circle().foregroundStyle(.blue)
            }.frame(height: 300)
            Rectangle().foregroundStyle(.orange)
            HStack{
                Rectangle().foregroundStyle(.blue)
                Rectangle().foregroundStyle(.orange)
                Rectangle().foregroundStyle(.yellow)
            }
        }.background(.red).padding(.vertical, 10)
    }
}


#Preview {
    ExampleYTExercise()
}
