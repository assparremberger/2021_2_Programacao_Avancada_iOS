//
//  ContentView.swift
//  AppTarefas
//
//  Created by Adalto Selau Sparremberger on 09/10/21.
//

import SwiftUI

struct TaskListView: View {
    
    @ObservedObject var taskListViewModel = TaskListViewModel()
    
    @State var presentAddNewItem = false
    
    @State var textButton = "Adicionar nova Tarefa"
    
    var body: some View {
        
        NavigationView{
            VStack{
                List{
                    ForEach ( self.taskListViewModel.taskCellViewModels){ taskCellVM  in
                        //criar a célula
                        TaskCell( taskCellViewModel: taskCellVM)
                        
                    }
                    .onDelete{ indexSet in
                        self.taskListViewModel.removeTasks(atOffsets: indexSet)
                    }
                    
                    if presentAddNewItem{
                        TaskCell(taskCellViewModel: TaskCellViewModel.newTask()){ result in
                            if case .success( let task) = result{
                                self.taskListViewModel.addTask(task: task)
                            }
                            self.presentAddNewItem.toggle()
                            self.textButton = "Adicionar nova Tarefa"
                        }
                    }
                    
                }
                Button(action: {
                    self.presentAddNewItem.toggle()
                    if( self.presentAddNewItem ){
                        self.textButton = "Cancelar"
                    }else{
                        self.textButton = "Adicionar nova Tarefa"
                    }
                } ){
                    HStack{
                        Image(systemName: "plus.circle.fill")
                            .resizable().frame(width: 20, height: 20)
                        Text( self.textButton )
                    }
                }
                .padding()
            }
            .navigationBarTitle("Tarefas")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}

struct TaskCell: View{
    
    @ObservedObject var taskCellViewModel: TaskCellViewModel
    
    var onCommit: (Result<Task, InputError>) -> Void = {_ in }
    
    var body: some View{
        HStack{
            Image(systemName: taskCellViewModel.completionStateIconName)
                .resizable()
                .frame(width: 20, height: 20)
            TextField( "Digite aqui sua tarefa", text: $taskCellViewModel.task.title,
                       onCommit: {
                    if self.taskCellViewModel.task.title.isEmpty{
                        self.onCommit(.failure(.empty))
                    }else{
                        self.onCommit( .success(self.taskCellViewModel.task))
                    }
                }
            ).id( taskCellViewModel.id )
        }
    }
}


enum InputError: Error{
    case empty
}
