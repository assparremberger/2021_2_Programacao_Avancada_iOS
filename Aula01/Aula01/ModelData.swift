//
//  ModelData.swift
//  Aula01
//
//  Created by Adalto Selau Sparremberger on 11/09/21.
//

import Foundation

var locais: [Local] = load("landmarkData.json")

func load<T: Decodable>(_ filename: String) -> T{
    let data: Data
    
    // pegar o arquivo JSON
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else{
        fatalError("Não foi possível encontar o arquivo: \(filename)")
    }
    
    // ler os dados do JSON
    do{
        data = try Data(contentsOf: file)
    }catch{
        fatalError("Erro ao ler o \(filename). \nErro: \n \(error)")
    }
    
    do{
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }catch{
        fatalError("Erro ao decodificar o \(filename). \nErro: \n \(error)")
    }
}
