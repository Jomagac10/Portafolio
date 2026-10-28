//
//  Place.swift
//  Swift UI Project
//
//  Created by Jose Manuel Garcia Chavez on 27/10/26.
//

import Foundation
import MapKit

struct Place : Identifiable{
    let id = UUID()
    var title: String
    var coordinates: CLLocationCoordinate2D
    var favorite: Bool
}
