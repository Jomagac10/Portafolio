//
//  LabelExample.swift
//  Swift UI Project
//
//  Created by Jose Manuel Garcia Chavez on 27/04/26.
//

import SwiftUI

struct LabelExample: View {
    var body: some View {
        Label("Title", systemImage: "figure.walk")
        Label {
            Text("Title")
        } icon: {
            Image("Real_Madrid_CF").resizable().frame(width: 100, height: 120).scaledToFit()
        }

//        Label("Title", image: "Real_Madrid_CF")
    }
}

#Preview {
    LabelExample()
}
