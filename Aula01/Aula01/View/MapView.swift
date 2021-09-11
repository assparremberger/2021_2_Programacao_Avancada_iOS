//
//  MapView.swift
//  Aula01
//
//  Created by Adalto Selau Sparremberger on 11/09/21.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    var coordinate: CLLocationCoordinate2D
    
    @State var regiao = MKCoordinateRegion()
    
    var body: some View {
        Map(coordinateRegion: $regiao)
            .onAppear {
            setRegion(coordinate)
        }
    }
    
    private func setRegion(_ coordenadas: CLLocationCoordinate2D){
        regiao = MKCoordinateRegion(
            center: coordenadas ,
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )
    }
     
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: -30.03461, longitude:  -51.22664 ) )
    }
}
