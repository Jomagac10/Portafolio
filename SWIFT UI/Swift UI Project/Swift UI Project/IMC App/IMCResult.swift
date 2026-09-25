//
//  IMCResult.swift
//  Swift UI Project
//
//  Created by Jose Manuel Garcia Chavez on 25/09/26.
//

import SwiftUI

struct IMCResult: View {
    
    let userHeight: Double
    let userWeight: Double
    var body: some View {
        VStack{
            Text("Tu resultado: ").font(.title).bold().foregroundStyle(.white)
            let result = CalculateHeight(userHeight: userHeight, userWeight: userWeight)
            InformationView(result: result)
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(.backgroundIMC)
    }
}

func CalculateHeight(userHeight: Double, userWeight: Double) -> Double{
    let height = userHeight / 100
    let result = userWeight / (height*height)
    return result
}

struct InformationView: View {
    let result : Double
    var body: some View {
        Text("\(result)").font(.largeTitle).bold().foregroundStyle(.white)
    }
}

#Preview {
    IMCResult(userHeight: 170, userWeight: 180)
}
