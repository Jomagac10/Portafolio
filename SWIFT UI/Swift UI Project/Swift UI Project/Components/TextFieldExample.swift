//
//  TextFieldExample.swift
//  Swift UI Project
//
//  Created by Jose Manuel Garcia Chavez on 28/04/26.
//

import SwiftUI

struct TextFieldExample: View {
    @State var email: String = ""
    @State var password: String = ""
    var body: some View {
        VStack {
            TextField("Email: ", text: $email)
                .keyboardType(.asciiCapable)
                .padding()
                .background(.gray.opacity(0.15))
                .cornerRadius(15)
                .padding(.horizontal, 30)
                .onChange(of: email) { oldValue, newValue in
                    print("el antiguo es \(oldValue), el nuevo es \(newValue)")
                }
            SecureField("Password: ", text: $password)
                .keyboardType(.asciiCapable)
                .padding()
                .background(.gray.opacity(0.15))
                .cornerRadius(15)
                .padding(.horizontal, 30)
                .onChange(of: password) { oldValue, newValue in
                    print("el antiguo es \(oldValue), el nuevo es \(newValue)")
                }
        }
    }
}

#Preview {
    TextFieldExample()
}
