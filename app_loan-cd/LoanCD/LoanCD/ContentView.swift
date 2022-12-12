//
//  LoanView.swift
//  LoanCD
//
//  Created by Carlos Amaral on 23/11/21.
//

import SwiftUI
import CoreData

struct LoanView: View {
    @Environment(\.managedObjectContext) private var viewContext

    //Receber dados do core data
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Loan.startDate, ascending: true)],
        animation: .default)
    private var loans: FetchedResults<Loan>
    @State var isAddLoanShowing : Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(loans) { loan in
                    LoanCellView(name: loan.name ?? "Unknow", amount: loan.totalAmount, date: loan.dueDate ?? Date() )
                }
                .onDelete(perform: deleteItems)
            }
            .listStyle(PlainListStyle())
            .navigationTitle("All Loans")
            .navigationBarItems(trailing:
            Button {
                isAddLoanShowing = true
            } label : {
                Image(systemName: "plus")
                    .font(.title)
            })
        }
        .accentColor(Color(.label))
        .sheet(isPresented: $isAddLoanShowing) {
            AddLoanView(viewModel: AddLoanViewModel(isAddLoanShowing: $isAddLoanShowing))
        }
    }

    private func addItem() {
        withAnimation {
            let newLoan = Loan(context: viewContext)
            newLoan.name = "Test loan"
            newLoan.totalAmount = 1000
            newLoan.startDate = Date()
            newLoan.dueDate = Date()
            
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { loans[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoanView()
        
    }
}
