//
//  ContentView.swift
//  AppTarefas
//
//  Created by Adalto Selau Sparremberger on 09/10/21.
//

import SwiftUI

struct TaskListView: View {
    
    var tasks: [Task] = testDataTasks
    
    var body: some View {
        
        NavigationView{
            Vs
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}
