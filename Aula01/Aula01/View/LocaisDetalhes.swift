//
//  LocaisDetalhes.swift
//  Aula01
//
//  Created by Adalto Selau Sparremberger on 11/09/21.
//

import SwiftUI
import MapKit

struct LocaisDetalhes: View {
    
    var local: Local
    
    var body: some View {
        
        ScrollView{
            
            MapView( coordinate: local.locationCoordinate )
                .ignoresSafeArea()
                .frame(height:300)
            
            ImagemRedondaView(image: local.image)
                .offset(y: -110)
                .padding(.bottom, -90)
            
            VStack{
                Text(local.name)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.primary)
                    .padding()
                HStack{
                    Text(local.park)
                    Spacer()
                    Text(local.state)
                }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding()
                
                Divider()
                Text(local.description)
                    .font(.title2)
                    .padding()
            }.padding()
            
        }.navigationBarTitle(local.name, displayMode: .inline)
        .padding()
    }
}



struct LocaisDetalhes_Previews: PreviewProvider {
    static var previews: some View {
        LocaisDetalhes(local: locais[1])
    }
}
