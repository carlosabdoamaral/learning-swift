//
//  ItemDetailsView.swift
//  Todoey
//
//  Created by Carlos Amaral on 01/01/22.
//

import CoreData
import SwiftUI

struct ItemDetailsView: View {
    @Environment(\.managedObjectContext) var db
    
    public var itemComplete : Item?
    public var title : String?
    public var data : Date?
    public var id : UUID?
    
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    Text(self.title ?? "Erro")
                        .font(.title3)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                
                List {
                }
                .edgesIgnoringSafeArea(.bottom)
            }
        }
        .navigationBarItems(
            trailing:
                Button("Delete") {
                    try? db.delete(self.itemComplete!)
                }
                .foregroundColor(.red)
        )
    }
}

struct ItemDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailsView()
    }
}
