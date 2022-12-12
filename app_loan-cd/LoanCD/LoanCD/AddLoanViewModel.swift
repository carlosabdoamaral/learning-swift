//
//  AddLoanViewModel.swift
//  LoanCD
//
//  Created by Carlos Amaral on 23/11/21.
//

import SwiftUI

final class AddLoanViewModel: ObservableObject {
    
    @Published var name : String = ""
    @Published var amount : String = ""
    @Published var startDate : Date = Date()
    @Published var dueDate : Date = Date()
    var isAddLoanShowing: Binding<Bool>
    
    init(isAddLoanShowing: Binding<Bool>) {
        self.isAddLoanShowing = isAddLoanShowing
    }
    
    func isValidForm() -> Bool {
        return name.isEmpty || amount.isEmpty
    }
    
    func saveLoan() {
        let newLoan = Loan(context: PersistenceController.shared.viewContext)
        newLoan.id = UUID().uuidString
        newLoan.name = name
        newLoan.totalAmount = Double(amount) ?? 0.0
        newLoan.startDate = startDate
        newLoan.dueDate = dueDate
        
        PersistenceController.shared.save()
    }
    
}
