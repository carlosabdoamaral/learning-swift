//
//  ContentView.swift
//  Todoey
//
//  Created by Carlos Amaral on 01/01/22.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var db
        
    @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "data", ascending: false)]) var items : FetchedResults<Item>
    
    @State private var deleted : Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    HStack {
                        
                        if item.checked {
                            ZStack {
                                Circle()
                                    .foregroundColor(Color.blue)
                                    .frame(width: 20, height: 20)
                                
                            }
                            .onTapGesture {
                                if item.checked {
                                    item.checked = false
                                    try? db.save()
                                }
                                
                                else {
                                    item.checked = true
                                    try? db.save()
                                }
                            }
                        }
                        else {
                            ZStack {
                                Circle()
                                    .strokeBorder(lineWidth: 2, antialiased: true)
                                    .foregroundColor(.gray)
                                    .cornerRadius(5)
                                    .padding(0)
                                    .frame(width: 20, height: 20)
                            }
                            .onTapGesture {
                                if item.checked {
                                    item.checked = false
                                    try? db.save()
                                }
                                
                                else {
                                    item.checked = true
                                    try? db.save()
                                }
                            }
                        }
                        
                        NavigationLink(destination: ItemDetailsView(itemComplete: item ,title: item.content, data: item.data, id: item.id)) {
                            Text(item.content ?? "Erro")
                                .lineLimit(1)
                        }
                        
                        Spacer()
                    }

                }
            }
            .navigationTitle("Todoey")
            .navigationBarItems(
                trailing:
                    
                    NavigationLink(destination: {
                        AddItemView()
                    }, label: {
                        Image(systemName: "plus")
                    })
            )
            .alert(isPresented: $deleted) {
                Alert(
                    title: Text("Success"),
                    message: Text("Your item was removed successfuly.")
                )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
