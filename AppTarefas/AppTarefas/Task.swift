//
//  Task.swift
//  AppTarefas
//
//  Created by Adalto Selau Sparremberger on 09/10/21.
//

import Foundation


enum TaskPriority{
    case hign
    case medium
    case low
}

struct Task: Identifiable{
    var id: String = UUID().uuidString
    var title: String
    var priority: TaskPriority
    var completed: Bool
}

let testDataTasks = [
    Task(title: "Criar o projeto", priority: .medium, completed: true) ,
    Task(title: "Conectar com Firebase", priority: .hign, completed: false) ,
    Task(title: "Publicar o App", priority: .low, completed: false)
]
