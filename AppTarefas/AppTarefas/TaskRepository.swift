//
//  TaskRepository.swift
//  AppTarefas
//
//  Created by Adalto Selau Sparremberger on 09/10/21.
//

import Foundation


class BaseTaskRepository{
    @Published var tasks = [Task]()
}


protocol TaskRepository: BaseTaskRepository{
    func addTask(_ task: Task)
    func removeTask(_ task: Task)
    func updateTask(_ task: Task)

}
