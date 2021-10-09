//
//  TaskListViewModel.swift
//  AppTarefas
//
//  Created by Adalto Selau Sparremberger on 09/10/21.
//

import Foundation

class TaskListViewModel: ObservableObject{
    
    @Published var taskCellViewModels: [TaskCellViewModel]
    
    // Adicionar depois...
    
    init(){
        self.taskCellViewModels = testDataTasks.map{ task in
            TaskCellViewModel(task: task)
        }
    }
    
    func addTask(task: Task){
        self.taskCellViewModels.append( TaskCellViewModel(task: task) )
    }
    
    func removeTasks(atOffsets indexSet: IndexSet ){
        self.taskCellViewModels.remove(atOffsets: indexSet)
    }
    
    
}
