//
//  LocaisView.swift
//  Aula01
//
//  Created by Adalto Selau Sparremberger on 11/09/21.
//

import SwiftUI

struct LocaisView: View {
    var body: some View{
        NavigationView{
            
            List(locais, id: \.id){ local in
                
                NavigationLink( destination: LocaisDetalhes(local: local)){
                    LocaisRowView(local: local)
                }
                
            }.navigationTitle("Meus Locais")
        }
    }
}

struct LocaisView_Previews: PreviewProvider {
    static var previews: some View {
        LocaisView()
    }
    
}
