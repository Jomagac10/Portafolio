//
//  CustomDialog.swift
//  Swift UI Project
//
//  Created by Jose Manuel Garcia Chavez on 27/10/26.
//

import SwiftUI

struct CustomDialog<Content:View>: View {
    
    let closeDialog: () -> Void
    let onDismissOutside: Bool
    let content: Content
    
    var body: some View {
        ZStack{
            Rectangle().fill(.gray.opacity(0.5)).ignoresSafeArea().onTapGesture {
                if onDismissOutside {
                    closeDialog()
                }
            }
            content
                .frame(width: UIScreen.main.bounds.size.width-100,
                       height: 200)
                .background(.white)
                .clipShape(.rect(cornerRadius: 15))
                .overlay(alignment: .topTrailing) {
                    Button(action: {
                        withAnimation(.smooth) {
                            closeDialog()
                        }
                    }, label: {
                        Image(systemName: "xmark.circle").foregroundStyle(.gray).padding(15)
                    })
                }
        }.ignoresSafeArea().frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height,
                                  alignment: .center)
    }
}

#Preview {
    let text = Text("Hola")
    CustomDialog(closeDialog: {}, onDismissOutside: true, content: text)
}
