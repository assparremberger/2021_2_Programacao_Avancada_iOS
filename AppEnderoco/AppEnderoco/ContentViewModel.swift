//
//  ContentViewModel.swift
//  AppEnderoco
//
//  Created by Adalto Selau Sparremberger on 16/10/21.
//

import Foundation

class ContentViewModel: ObservableObject{
    
    @Published var endereco: Endereco
    
    init(){
        self.endereco = Endereco()
    }
    
    func buscaCEP( cep: String ){
        if let url = URL(string: "https://viacep.com.br/ws/"+cep+"/json/"){
            let task = URLSession.shared.dataTask(with: url) { (dados, response, erro) in
                if erro == nil{
                    if let dadosRecebidos = dados{
                        do{
                            if let objJSON = try JSONSerialization.jsonObject(with: dadosRecebidos, options: []) as? [String: Any]{
                                if let logradouro = objJSON["logradouro"] as? String{
                                    self.endereco.logradouro = logradouro
                                }
                                if let localidade = objJSON["localidade"] as? String{
                                    self.endereco.localidade = localidade
                                }
                            }
                        }catch{
                            print( "Erro ao tratar os dados")
                        }
                    }
                }else{
                    print(erro!)
                }
            }
            task.resume()
        }
    }
    
    
}
