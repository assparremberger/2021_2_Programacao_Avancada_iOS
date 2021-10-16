//
//  Task.swift
//  AppTarefas
//
//  Created by Adalto Selau Sparremberger on 09/10/21.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift


enum TaskPriority: Int , Codable{
    case hign
    case medium
    case low
}

// Codable
// De acordo com a documentação da Apples, Codable é "um tipo que pode se converter dentro e fora de uma representação externa". Na verdade, Codable é um alias de tipo para os protocolos Encodable e Decodable. Ao conformar um tipo Swift a este protocolo, o compilador irá sintetizar o código necessário para codificar / decodificar uma instância desse tipo a partir de um formato serializado, como JSON.

struct Task: Codable, Identifiable{
    @DocumentID var id: String?
    var title: String
    var priority: TaskPriority
    var completed: Bool
    
}

let testDataTasks = [
    Task(title: "Criar o projeto", priority: .medium, completed: true) ,
    Task(title: "Conectar com Firebase", priority: .hign, completed: false) ,
    Task(title: "Publicar o App", priority: .low, completed: false)
]
