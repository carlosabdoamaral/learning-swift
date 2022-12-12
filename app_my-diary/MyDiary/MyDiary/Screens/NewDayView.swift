//
//  NewDayView.swift
//  MyDiary
//
//  Created by Carlos Amaral on 01/01/22.
//

import CoreData
import SwiftUI

struct NewDayView: View {
    @Environment(\.managedObjectContext) var db
    @StateObject private var dataController = DataController()
    
    @State private var happy : Double = 0.00
    @State private var love : Double = 0.00
    @State private var sad : Double = 0.00
    
    @State private var title : String = ""
    @State private var desc : String = ""
    @State private var data : Date = Date()
    
    @State private var isShowingAlert : Bool = false
    
    func saveDay() {
        let newDay = Day(context: db)
        newDay.id = UUID()
        newDay.sad = self.sad
        newDay.love = self.love
        newDay.happy = self.happy
        newDay.data = self.data
        newDay.title = self.title
        newDay.desc = self.desc
        
        try? db.save()
        
        self.isShowingAlert = true
    }
    
    var body: some View {
        ZStack {
            //MARK: BACKGROUND
            LinearGradient(
                colors: [Color.blue, Color.green],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
                )
                .edgesIgnoringSafeArea(.all)
            
            //MARK: BODY
            VStack {
                
                
                //MARK: SLIDERS
                VStack {
                    VStack(alignment: .leading) {
                        Text("Happy")
                        Slider(value: $happy, in: 0...10)
                            .tint(.yellow)
                    } // VSTACK

                    VStack(alignment: .leading) {
                        Text("Love")
                        Slider(value: $love, in: 0...10)
                            .tint(.red)
                    } // VSTACK
                    
                    VStack(alignment: .leading) {
                        Text("Sad")
                        Slider(value: $sad, in: 0...10)
                            .tint(.gray)
                    } // VSTACK
                    
                } // VSTACK
                .padding()
                .background(.white)
                .foregroundColor(.gray)
                .cornerRadius(15)
                .padding()
                
                VStack {
                    
                    TextField("Give a title", text: $title)
                        .padding()
                        .background()
                        .cornerRadius(5)
                    
                    TextField("Give a description", text: $desc)
                        .padding()
                        .background()
                        .cornerRadius(5)
                    
                    DatePicker("Date", selection: $data)
                        .padding()
                        .background()
                        .cornerRadius(5)
                } // FORM - VSTACK
                .padding()
                .background(.white)
                .foregroundColor(.gray)
                .cornerRadius(15)
                .padding()
                
                
                Button ("Add") {
                    saveDay()
                }
                .foregroundColor(.blue)
                .padding()
                .padding(.horizontal)
                .background()
                .cornerRadius(5)
                .alert(isPresented: $isShowingAlert) {
                    Alert(
                        title: Text("Success!"),
                        message: Text("You can close this alert and go to home screen to se your diary resume")
                    )
                }
                
                
                Spacer()
                
            } // VSTACK
            
        } // ZSTACK
        .colorScheme(.light)
        .environment(\.managedObjectContext, dataController.container.viewContext)
    }
}

struct NewDayView_Previews: PreviewProvider {
    static var previews: some View {
        NewDayView()
    }
}
