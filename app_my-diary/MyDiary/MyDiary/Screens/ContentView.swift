//
//  ContentView.swift
//  MyDiary
//
//  Created by Carlos Amaral on 01/01/22.
//

import CoreData
import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var db
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "data", ascending: false)]) var days : FetchedResults<Day>
    
    @StateObject private var dataController = DataController()
    
    @State private var speed : Double = 5.0
    @State private var isEditing = false
    
    @State private var happy : Double = 0
    @State private var sad : Double = 0
    @State private var love : Double = 0
    
    @State private var happyValues : [Double] = []
    @State private var loveValues : [Double] = []
    @State private var sadValues : [Double] = []
    
    func calc() {
        for day in days {
            happyValues.append(day.happy)
        }
        
        for k in days {
            loveValues.append(k.love)
        }
        
        for j in days {
            sadValues.append(j.sad)
        }
        
        let happyX = happyValues.reduce(0,+)
        let loveX = loveValues.reduce(0,+)
        let sadX = sadValues.reduce(0,+)
        
        if happyValues.isEmpty {
            self.happy = 0
        } else {
            self.happy = Double(Int(happyX) / happyValues.count)
        }
        
        if loveValues.isEmpty {
            self.love = 0
        } else {
            self.love = Double(Int(loveX) / loveValues.count)
        }
        
        if sadValues.isEmpty {
            self.sad = 0
        } else {
            self.sad = Double(Int(sadX) / sadValues.count)
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                
                //MARK: BACKGROUND
                LinearGradient(
                    colors: [Color.blue, Color.green],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                    .edgesIgnoringSafeArea(.all)
                
                
                VStack {
                    //MARK: MAIN BANNER
                    VStack {
                        Section(
                            header:
                                HStack {
                                    Text("Happy")
                                        .foregroundColor(.gray)
                                    Spacer()
                                }
                        ){
                            Slider(value: $happy, in: 0...10)
                                .tint(.yellow)
                        }
                        
                        Section(
                            header:
                                HStack {
                                    Text("Love")
                                        .foregroundColor(.gray)
                                    Spacer()
                                }
                        ){
                            Slider(value: $love, in: 0...10)
                                .tint(.red)
                        }
                        
                        Section(
                            header:
                                HStack {
                                    Text("Sad")
                                        .foregroundColor(.gray)
                                    Spacer()
                                }
                        ){
                            Slider(value: $sad, in: 0...10)
                                .tint(.gray)
                        }
                    }
                    .padding()
                    .background(.white)
                    .cornerRadius(15)
                    .padding()
                    
                    
                    //MARK: LIST
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(days) { day in
                                
                                NavigationLink(destination: DayDetailsView(day: day)) {
                                    VStack(alignment: .leading, spacing: 10) {
                                        Text(day.data!, format: .dateTime.day().month().year())
                                            .foregroundColor(.gray)
                                            .fontWeight(.bold)
                                            .padding(.vertical)
                                            .padding(.horizontal)
                                        
                                        HStack {
                                            Text("😃")
                                            
                                            HStack {
                                                Text("\(day.happy, specifier: "%.0f") / 10")
                                                    .font(.body)
                                                    .fontWeight(.bold)
                                            }
                                        }
                                        .foregroundColor(.gray)
                                        
                                        HStack {
                                            Text("🥰")
                                            
                                            HStack {
                                                Text("\(day.love, specifier: "%.0f") / 10")
                                                    .font(.body)
                                                    .fontWeight(.bold)
                                            }
                                        }
                                        .foregroundColor(.gray)
                                        
                                        HStack {
                                            Text("😔")
                                            
                                            HStack {
                                                Text("\(day.sad, specifier: "%.0f") / 10")
                                                    .font(.body)
                                                    .fontWeight(.bold)
                                            }
                                        }
                                        .foregroundColor(.gray)
                                    }
                                    .padding()
                                    .background(.white)
                                    .cornerRadius(15)
                                }
                            }
                            .padding(.leading)
                        }
                    }
                    
                    Spacer()
                }
                .onAppear {
                    calc()
                }
            }
            .navigationTitle("My Diary")
            .navigationBarItems(
                trailing:
                    
                    NavigationLink(destination: NewDayView()) {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                    }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
