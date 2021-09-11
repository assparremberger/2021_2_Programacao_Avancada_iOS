//
//  ContentView.swift
//  AppOndeEstou
//
//  Created by Adalto Selau Sparremberger on 11/09/21.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel()
    
    
    
    var body: some View {
        Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
            .ignoresSafeArea()
            .onAppear{
                viewModel.checkIfLocationServicesIsEnabled()
            }
        
    }
}

final class ContentViewModel: NSObject, ObservableObject, CLLocationManagerDelegate{
    
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: -30.03835, longitude: -51.17399),
        span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03))
    
    var locationManager : CLLocationManager?
    
    func checkIfLocationServicesIsEnabled() {
        if CLLocationManager.locationServicesEnabled(){
            locationManager = CLLocationManager()
            locationManager!.delegate = self
        }else{
            
        }
    }
    
    func checkLocationAuthorization(){
        guard let locationManagerLocal = locationManager else {
            return
        }
        
        switch locationManagerLocal.authorizationStatus {
        case .notDetermined:
            locationManagerLocal.requestWhenInUseAuthorization()
        case .restricted:
            print("Existe uma restrição")
        case .denied:
            print("Verifique as comnfigurações de localização")
        case .authorizedAlways, .authorizedWhenInUse:
            region = MKCoordinateRegion(
                        center: locationManagerLocal.location!.coordinate,
                        span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
                    )
        default:
            break
        }
        
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
