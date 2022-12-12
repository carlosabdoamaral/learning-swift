//
//  ContentView.swift
//  DailyMessage
//
//  Created by Carlos Amaral on 17/01/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var message : String = "Loading..."
    @EnvironmentObject var network: Network
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.blue.edgesIgnoringSafeArea(.all)
                VStack(alignment: .center) {
                    
                    VStack {
                        Image(systemName: "quote.opening")
                            .padding()
                        
                        RoundedRectangle(cornerRadius: 15)
                            .frame(height: 1)
                        
                        ForEach(network.Messages) {m in
                            Text(m.content)
                                .font(.title2)
                                .fontWeight(.bold)
                                .italic()
                        }
                    }
                    .frame(maxWidth: UIScreen.screenWidth , alignment: .center)
                    .padding(30)
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("Sortear outra mensagem")
                            .foregroundColor(.white)
                    }
                }
            }
            .navigationTitle("Daily Message")
        }
        .preferredColorScheme(.dark)
        .onAppear {
            network.getMessages()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Network())
    }
}
