//
//  MapsExample.swift
//  Swift UI Project
//
//  Created by Jose Manuel Garcia Chavez on 21/10/26.
//

import SwiftUI
import MapKit

import SwiftUI
import MapKit

struct MapsExample: View {
    @State private var position: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: 19.303488,
                longitude: -99.150812
            ),
            span: MKCoordinateSpan(
                latitudeDelta: 0.01,
                longitudeDelta: 0.01
            )
        )
    )
    
    var body: some View {
        ZStack{
            MapReader{proxy in
                Map(position: $position){
//                    Marker()
                }
                .mapStyle(.hybrid(showsTraffic: true))
                .onMapCameraChange(frequency: .continuous) { coords in
                    print("coordenadas: \(coords.region.center) ")
                }.onTapGesture { coords in
                    withAnimation {
                        if let coordinates = proxy.convert(coords, from: .local){
                            position = .region(
                                MKCoordinateRegion(
                                    center: CLLocationCoordinate2D(
                                        latitude: coordinates.latitude,
                                        longitude: coordinates.longitude
                                    ),
                                    span: MKCoordinateSpan(
                                        latitudeDelta: 0.01,
                                        longitudeDelta: 0.01
                                    )
                                )
                            )
                        }
                    }
                    
                }
            }
            
            VStack{
                Spacer()
                HStack(spacing: 20){
                    Button("Ir a la condechi"){
                        withAnimation(.easeIn) {
                            position = .region(
                                MKCoordinateRegion(
                                    center: CLLocationCoordinate2D(
                                        latitude: 19.408938,
                                        longitude: -99.1680317
                                    ),
                                    span: MKCoordinateSpan(
                                        latitudeDelta: 0.01,
                                        longitudeDelta: 0.01
                                    )
                                )
                            )
                        }
                        
                    }.padding(5).background(.white).cornerRadius(10).padding(5).background(.yellow).padding(10).background(.blue).cornerRadius(16)
                    Button("Regresar"){
                        position = .region(
                            MKCoordinateRegion(
                                center: CLLocationCoordinate2D(
                                    latitude: 19.303488,
                                    longitude: -99.150812
                                ),
                                span: MKCoordinateSpan(
                                    latitudeDelta: 0.01,
                                    longitudeDelta: 0.01
                                )
                            )
                        )
                    }.padding(10).background(.white)
                    Button("Ir al aeropuerto"){
                        position = .region(
                            MKCoordinateRegion(
                                center: CLLocationCoordinate2D(
                                    latitude: 19.4289855,
                                    longitude: -99.0905283
                                ),
                                span: MKCoordinateSpan(
                                    latitudeDelta: 0.01,
                                    longitudeDelta: 0.01
                                )
                            )
                        )
                    }.padding(10).background(.white)
                }.padding(5)
                Spacer().frame(maxHeight: 15)
            }
        }
    }
}

#Preview {
    MapsExample()
}
