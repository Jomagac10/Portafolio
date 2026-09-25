//
//  ImageExample.swift
//  Swift UI Project
//
//  Created by Jose Manuel Garcia Chavez on 25/04/26.
//

import SwiftUI

struct ImageExample: View {
    var body: some View {
        Image(systemName: "figure.walk").resizable().frame(width: 100, height: 150).scaledToFit()
        Image("Real_Madrid_CF").resizable().scaledToFit()
    }
}

#Preview {
    ImageExample()
}
