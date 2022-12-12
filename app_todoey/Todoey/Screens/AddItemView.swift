//
//  AddItemView.swift
//  Todoey
//
//  Created by Carlos Amaral on 01/01/22.
//

import CoreData
import SwiftUI

struct AddItemView: View {
    @Environment(\.managedObjectContext) var db
    @StateObject private var dataController = DataController()
    @State private var t : String = ""
    @State private var errorMessage : String = ""
    @State private var added : Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                TextField("Add item", text: $t)
                    .padding()
                
                Text("\(errorMessage)")
                    .foregroundColor(.red)
                
                Button("Add") {
                    
                    if t.isEmpty {
                        errorMessage = "You have to write something"
                    } else {
                        errorMessage = ""
                        let item = Item(context: db)
                        item.id = UUID()
                        item.content = self.t
                        item.data = Date()
                        item.checked = false
                        
                        try? db.save()
                        self.added = true
                    }
                }
                .padding()
                
                Spacer()
            }
            .navigationTitle("Add Item")
            .alert(isPresented: $added) {
                Alert(
                    title: Text("Success"),
                    message: Text("Your item was add successfuly.")
                )
            }
        }
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView()
    }
}
