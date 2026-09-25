//
//  IMCView.swift
//  Swift UI Project
//
//  Created by Jose Manuel Garcia Chavez on 25/09/26.
//

import SwiftUI

struct IMCView: View {
//    init(){
//        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
//    }
    
    @State var gender: Int = 0
    @State var height: Double = 100
    @State var age: Int = 18
    @State var weight: Int = 50
    
    var body: some View {
        VStack{
            HStack{
                ToogleButton(text: "Hombre", imageName: "heart.fill", gender: 0, selectedGender: $gender)
                ToogleButton(text: "Mujer", imageName: "star.fill", gender: 1, selectedGender: $gender)
            }
            HeightCalculator(selectedHeight: $height)
            HStack{
                CalculatorBase(text: "Edad", value: $age)
                CalculatorBase(text: "Peso", value: $weight)
            }
            CalculateButton(userHeight: height, userWeight: Double(weight))
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.backgroundIMC)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("IMC calculator").bold().foregroundStyle(.white)
                }
            }
//            .navigationTitle("IMC calculator")
    }
}

struct ToogleButton: View {
    let text: String
    let imageName: String
    let gender: Int
    @Binding var selectedGender: Int
    
    var body: some View {
        
        let color = if(gender == selectedGender){
            Color.backgroundComponentSelected
        }else{
            Color.backgroundComponent
        }
        
        Button(action: {
            selectedGender = gender
        }) {
            VStack{
                Image(systemName: imageName).resizable().scaledToFit().frame(height: 100).foregroundStyle(.white)
                InfoText(text: text)
            }.frame(maxWidth: .infinity, maxHeight: .infinity).background(color)
        }
    }
}

struct HeightCalculator: View {
    @Binding var selectedHeight: Double
    var body: some View {
        VStack{
            TitleText(text: "Altura")
            InfoText(text: " \(Int(selectedHeight)) cm")
            Slider(value: $selectedHeight, in: 100 ... 200, step: 1).accentColor(.pink).padding(.horizontal, 30)
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(.backgroundComponent)
    }
}

struct CalculatorBase: View {
    let text: String
    @Binding var value: Int
    
    var body: some View {
        VStack{
            TitleText(text: text)
            InfoText(text: "\(Int(value))")
            HStack{
                ButtonCalculator(imageName: "minus", valueToModify: -1, modifyValue: $value).padding()
                
                ButtonCalculator(imageName: "plus", valueToModify: 1, modifyValue: $value).padding()
            }.padding(.horizontal, 10)
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(.backgroundComponent)
    }
}

struct InfoText: View {
    let text: String
    var body: some View {
        Text(text).font(.largeTitle).bold().foregroundStyle(.white)
    }
}

struct TitleText: View {
    let text: String
    var body: some View {
        Text(text).font(.title2).foregroundStyle(.gray)
    }
}

struct ButtonCalculator: View {
    let imageName: String
    let valueToModify: Int
    @Binding var modifyValue : Int
    var body: some View {
        Button {
            let valueModified: Int = modifyValue + valueToModify
            let rangeValid = Range(0...100)
            if rangeValid.contains(valueModified){
                modifyValue += valueToModify
            }
        }label: {
            ZStack{
                Circle().frame(width: 70, height: 70).foregroundStyle(.purple)
                Image(systemName: imageName).resizable().scaledToFit().foregroundStyle(.white).frame(width: 50, height: 50)
            }
            
        }
    }
}

struct CalculateButton: View {
    let userHeight: Double
    let userWeight: Double
    var body: some View {
        NavigationStack{
            NavigationLink (
                destination: {
                    IMCResult(userHeight: userHeight,
                              userWeight: userWeight)})
            {
                Text("Calcular").font(.title2).foregroundStyle(.purple).bold().frame(maxWidth: .infinity, maxHeight: 100).background(.backgroundComponent)
            }
        }
    }
}


#Preview {
    IMCView()
//    ToogleButton(text: "Aris", imageName: "heart.fill", index: 0)
}
