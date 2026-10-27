//
//  MenuView.swift
//  Swift UI Project
//
//  Created by Jose Manuel Garcia Chavez on 25/09/26.
//

import SwiftUI
import MapKit

struct MenuView: View {
    @State private var position: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 19.303488, longitude: -99.150812),
            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        )
    )
    var body: some View {
        NavigationStack{
//            VStack{
//                NavigationLink( destination: IMCView()){
//                    Text("Title App")
//                }
//                Text("Title 1")
//                Text("Title 2")
//                Text("Title 3")
//                Text("Title 4")
//                Text("Title 5")
//            }
            List{
                NavigationLink( destination: IMCView()){
                    Text("Title App")
                }
                NavigationLink( destination: SuperHeroSearcher()){
                    Text("SuperHeroSearcher")
                }
                NavigationLink( destination: MapsExample()){
                    Text("Maps")
                }
                
                Text("Title 2")

                Text("Title 3")
            }
        }
    }
}

#Preview {
    MenuView()
}
