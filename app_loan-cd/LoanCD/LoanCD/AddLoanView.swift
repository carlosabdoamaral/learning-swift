//
//  AddLoanView.swift
//  LoanCD
//
//  Created by Carlos Amaral on 23/11/21.
//

import SwiftUI

struct AddLoanView: View {
    
    @ObservedObject var viewModel : AddLoanViewModel
    
    var body: some View {
        VStack {
            HStack {
                Button("Cancel", action: {
                    viewModel.isAddLoanShowing.wrappedValue = false
                })
                .padding()
                .font(.title3)
                
                Spacer()
                
                Button("Done", action: {
                    viewModel.saveLoan()
                    viewModel.isAddLoanShowing.wrappedValue = false
                })
                .padding()
                .font(.title3)
                .disabled(viewModel.isValidForm())
                
            }
            .padding()
            
            Form {
                TextField("Name", text: $viewModel.name)
                    .autocapitalization(.sentences)
                
                TextField("Amount", text: $viewModel.amount)
                    .keyboardType(.numberPad)
                
                DatePicker("Start date", selection: $viewModel.startDate, displayedComponents: .date)
                DatePicker("Due date", selection: $viewModel.dueDate, displayedComponents: .date)
            }
            
            
        }
    }
}
