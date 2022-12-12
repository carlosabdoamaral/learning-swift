//
//  ContentView.swift
//  PedraPapelTesoura WatchKit Extension
//
//  Created by Carlos Amaral on 20/12/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var userSelection : Int = 0
    @State private var computerSelection : Int = 0
    @State private var result : Int = 3
    @State private var win : Bool!
    
    
    //OPCOES
    // Pedra = 0
    // Papel = 1
    // Tesoura = 2
    
    //RESULT
    // 0 - EMPATE
    // 1 - PC
    // 2 - USER
    
    func sort() {
        computerSelection = Int.random(in: 0..<3)
        
        //EMPATE
        if userSelection == computerSelection { self.result = 0 }
        
        //USER - PEDRA
        else if (userSelection == 0 && computerSelection == 1) { self.result = 1; self.win = false } // PC Ganhou
        else if (userSelection == 0 && computerSelection == 2) { self.result = 2; self.win = true } // USER GANHOU
        
        //USER - PAPEL
        else if (userSelection == 1 && computerSelection == 0) { self.result = 2; self.win = true } // USER GANHOU
        else if (userSelection == 1 && computerSelection == 2) { self.result = 1; self.win = false } // PC Ganhou
        
        //USER - TESOURA
        else if (userSelection == 2 && computerSelection == 0) {self.result = 1; self.win = false} // PC GANHOU
        else if (userSelection == 2 && computerSelection == 1) {self.result = 2; self.win = true} // USER GANHOU
        
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                
                VStack {
                    Spacer()
                    
                    if result == 0 {
                        Text("Empatamos")
                            .font(.title3)
                            .fontWeight(.bold)
                            .lineLimit(1)
                        
                    }
                    
                    else if result == 1 {
                        Text("Não foi dessa vez")
                            .font(.title3)
                            .fontWeight(.bold)
                            .lineLimit(1)
                    }
                    
                    else if result == 2 {
                        Text("Parabéns 🎉🎊 🎈")
                            .font(.title3)
                            .fontWeight(.bold)
                            .lineLimit(1)
                    }
                    
                    else if result == 3 {
                        Text("Selecione uma opção")
                            .font(.title3)
                            .fontWeight(.bold)
                            .lineLimit(2)
                    }
                    
                    Spacer()
                    
                    HStack {
                        Text("🪨")
                            .frame(width: 40, height: 20)
                            .padding()
                            .cornerRadius(10)
                            .onTapGesture {
                                self.userSelection = 0
                                sort()
                            }
                        
                        Text("📄")
                            .frame(width: 40, height: 20)
                            .padding()
                            .cornerRadius(10)
                            .onTapGesture {
                                self.userSelection = 1
                                sort()
                            }
                        
                        Text("✂️")
                            .frame(width: 40, height: 20)
                            .padding()
                            .cornerRadius(10)
                            .onTapGesture {
                                self.userSelection = 2
                                sort()
                            }
                        
                    }
                }
                .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
