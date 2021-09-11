//
//  LocaisRowView.swift
//  Aula01
//
//  Created by Adalto Selau Sparremberger on 11/09/21.
//

import SwiftUI

struct LocaisRowView: View {
    
    var local: Local
    
    var body: some View{
        
        HStack{
            local.image.resizable().frame(width: 50, height: 50)
            Text(local.name)
            Spacer()
        }
        
    }
}

struct LocaisViewRow_Previews: PreviewProvider {
    static var previews: some View {
        LocaisRowView(local: locais[0])
    }
    
}

