//
//  FavoritePlaces.swift
//  Swift UI Project
//
//  Created by Jose Manuel Garcia Chavez on 27/10/26.
//

import SwiftUI
import MapKit

struct FavoritePlaces: View {
    @State var position: MapCameraPosition = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(
        latitude: 19.303488,
        longitude: -99.150812
    ), span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)))
    
    @State var places : [Place] = []
    @State var selectedCordinates: CLLocationCoordinate2D? = nil
    @State var name: String = ""
    @State var favorite: Bool = false
    @State var showSheet: Bool = false
    
    var body: some View {
        ZStack{
            MapReader{proxy in
                Map(position: $position){
                    ForEach(places) { place in
                        let colorAnnotation: Color = place.favorite ? Color.blue : Color.red
                        Annotation(place.title, coordinate: place.coordinates) {
                            Circle().stroke(lineWidth: 20)
                                .fill(colorAnnotation)
                                .frame(width: 20, height: 20)
                        }
                    }
                    
                }.onTapGesture { coords in
                    if let coordinates = proxy.convert(coords, from: .local){
                        selectedCordinates = coordinates
                    }
                }.overlay {
                    VStack{
                        Button("Show sheet"){
                            showSheet = true
                        }.padding(.vertical, 10)
                            .padding(.horizontal, 30)
                            .background(.white)
                            .clipShape(.rect(cornerRadius: 10))
                            .padding(10)
                        Spacer()
                    }
                }
            }
            
            let view = VStack{
                Text("Añadir localizacion")
                Spacer()
                TextField("Nombre", text: $name)
                Toggle("¿Es un lugar favorito?", isOn: $favorite)
                Spacer()
                Button {
                    if let coords = selectedCordinates{
                        saveCoordinates(name: name,
                                        coordinates: coords,
                                        isFavorite: favorite)
                        clearData()
                    }
                } label: {
                    Text("Guardar").font(.caption2)
                }
                
            }.padding(20)
            if let _ = selectedCordinates{
                CustomDialog(closeDialog: { clearData() }, onDismissOutside: true, content: view)
            }
        }
        .sheet(isPresented: $showSheet) {
            Text("Hola")
        }
    }
    
    func saveCoordinates(name: String, coordinates: CLLocationCoordinate2D, isFavorite: Bool){
        places.append(Place(title: name, coordinates: coordinates, favorite: isFavorite))
    }
    
    func clearData(){
        name.removeAll()
        favorite = false
        selectedCordinates = nil
    }
}

#Preview {
    FavoritePlaces()
}
