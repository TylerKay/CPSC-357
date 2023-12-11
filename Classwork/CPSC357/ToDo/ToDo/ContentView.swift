//
//  ContentView.swift
//  ToDo
//
//  Created by Tyler Kay on 10/19/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors:[]) private var todosCD: FetchedResults<TodoCD>
    
//    @State private var todos = [
//        Todo(name: "Do Project 2", category: "school"),
//        Todo(name: "Write Essay", category: "school"),
//        Todo(name: "Sleep", category: "health")
//    ]
    
    @State private var showAddTodoView = false

    
    var body: some View {
        NavigationView {
            List {
                ForEach(todosCD, id:\.self){ todo in
                    NavigationLink(destination:
                                    VStack{
                        Text(todo.name ?? "untitled")
                        Image(todo.category ?? "")
                            .resizable().frame(width: 200, height: 200)
                    }
                    ){
                        HStack{
                            Image(todo.category ?? "")
                                .resizable().frame(width: 50, height: 50)
                            Text(todo.name ?? "untitled")
                        }
                    }
                }
                .onDelete(perform: { indexSet in
                    deleteTodo(offsets: indexSet)
//                    todos.remove(atOffsets: indexSet)
                })
//                .onMove(perform: { indices, newOffset in
//                todos.move(fromOffsets: indices, toOffset: newOffset)
//                })
            }.navigationBarTitle("Todo Items")
                .navigationBarItems(
                    leading: Button("Add"){
                        self.showAddTodoView.toggle()
                    }.sheet(isPresented: $showAddTodoView){
                        AddTodoView(showAddTodoView: self.$showAddTodoView)
                    },
                    trailing: EditButton()
                )
        }
        
    }
    
    private func deleteTodo(offsets: IndexSet){
        for index in offsets{
            let todo = todosCD[index]
            viewContext.delete(todo)
        }
        do {
            try viewContext.save()
        } catch {
            let error = error as NSError
            fatalError("unresolved error:\(error)")
        }
    }
//
//    func addTodo(){
//        todos.append(Todo(name: "newTodo", category: "work"))
//    }
}


//struct Todo: Identifiable {
//    let id = UUID ()
//    var name: String
//    var category: String
//}


struct AddTodoView: View {
    @Binding var showAddTodoView: Bool
    @Environment(\.managedObjectContext) private var viewContext
//    @FetchRequest(sortDescriptors: []) private var todosCD: FetchedResults<TodoCD>
    
//    @Binding var todos: [Todo]
    @State private var selectedCategory = 0
    var categoryTypes = ["School", "Health"]
    @State private var name = ""
    
    var body: some View {
        Text("Add Todo view")
        TextField("To Do name", text: $name)
        Picker("", selection: $selectedCategory){
            ForEach(0 ..< categoryTypes.count){
                Text(self.categoryTypes[$0])
            }
        }
        Button("Done"){
            self.showAddTodoView = false
//            todos.append(Todo (name: name, category: categoryTypes[selectedCategory])
            let newTodoCD = TodoCD(context: viewContext)
            newTodoCD.name = name
            newTodoCD.category = categoryTypes[selectedCategory]
            
            do {
                try viewContext.save()
            }
            catch {
                let error = error as NSError
                fatalError("unresolved erorr: \(error)")
            }
        }
    }
}

#Preview {
    ContentView()
}
