//
//  ImagemRedondaView.swift
//  Aula01
//
//  Created by Adalto Selau Sparremberger on 11/09/21.
//

import SwiftUI

struct ImagemRedondaView: View {
    
    var image: Image
    
    var body: some View{
        image
            .clipShape(Circle())
            .overlay( Circle().stroke(Color.gray, lineWidth: 4) )
            .shadow(radius:20)
    }
}

struct ImagemRedondaView_Previews: PreviewProvider {
    static var previews: some View {
        ImagemRedondaView(image: Image("fspoa") )
    }
}
