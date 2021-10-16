//
//  ContentView.swift
//  AppEnderoco
//
//  Created by Adalto Selau Sparremberger on 16/10/21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel()
    
    @State var cep = String()
    
    var body: some View {
        VStack{
            TextField("Insira o CEP, só os números", text: $cep).border(.gray, width:2)
                .padding()
            Button(action: {
                self.viewModel.buscaCEP(cep: self.cep)
            } ){
                Text("Consultar")
            }.padding()
            HStack{
                Text("Logradouro: ")
                Text(self.viewModel.endereco.logradouro)
            }.padding()
            
            HStack{
                Text("Localidade: ")
                Text(self.viewModel.endereco.localidade)
            }.padding()
            
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
