//
//  FirestoreTaskRepository.swift
//  AppTarefas
//
//  Created by Adalto Selau Sparremberger on 09/10/21.
//

import Foundation
import FirebaseFirestore

class FirestoreTaskRepository: BaseTaskRepository, TaskRepository, ObservableObject{
    
    
    
    var db = Firestore.firestore()
    
    override init(){
        
        super.init()
            
        loadData()
    }
    
    func loadData(){
        db.collection("tasks").order(by: "title").addSnapshotListener{ (querySnapshot, error) in
            
            if let querySnapshot = querySnapshot{
                self.tasks = querySnapshot.documents.compactMap { document -> Task? in
                    try? document.data(as: Task.self)
                }
            }
        }
    }
    
    func addTask(_ task: Task) {
        do {
              let _ = try db.collection("tasks").addDocument(from: task)
            }
            catch {
              print("Erro ao salvar a Tarefa \(error.localizedDescription).")
            }
    }
    
    func removeTask(_ task: Task) {
        if let taskID = task.id {
              do {
                try db.collection("tasks").document(taskID).setData(from: task) // (1)
              }
              catch {
                print("There was an error while trying to update a task \(error.localizedDescription).")
              }
            }
    }
    
    func updateTask(_ task: Task) {
        if let taskID = task.id {
              db.collection("tasks").document(taskID).delete { (error) in // (1)
                if let error = error {
                  print("Error removing document: \(error.localizedDescription)")
                }
              }
            }
    }
    
    
}
