//
//  DayDetailsView.swift
//  MyDiary
//
//  Created by Carlos Amaral on 02/01/22.
//

import SwiftUI

struct DayDetailsView: View {
    
    @State public var day : Day?
    @State private var dayQuality = 0
    @State private var dayQualityLabel : String = ""
    
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
                VStack(alignment: .center, spacing: 5) {
                    
                    if day?.desc == "" { }
                    else {
                        Text("\(day?.desc ?? "Description")")
                            .fontWeight(.light)
                    }
                    
                } // TITLE - VSTACK
                .padding(.bottom)
                
                Spacer()

                
                //MARK: DAY ITEM
                GroupBox {
                    HStack {
                        Text("🗓")
                        Text("\(day?.data ?? Date(), format: .dateTime.day().month().year())")
                        Spacer()
                    }
                } // DAY - GROUPBOX
                .colorScheme(.light)
                
                
                //MARK: HAPPY ITEM
                GroupBox {
                    HStack {
                        Text("😃")
                        Text("\(day?.happy ?? 0.00, specifier: "%.3f")")
                        Spacer()
                    }
                } // HAPPY - GROUPBOX
                .colorScheme(.light)
                
                
                //MARK: LOVE ITEM
                GroupBox {
                    HStack {
                        Text("🥰")
                        Text("\(day?.love ?? 0.00, specifier: "%.3f")")
                        Spacer()
                    }
                } // HAPPY - GROUPBOX
                .colorScheme(.light)
                
                
                //MARK: SAD ITEM
                GroupBox {
                    HStack {
                        Text("🥰")
                        Text("\(day?.love ?? 0.00, specifier: "%.3f")")
                        Spacer()
                    }
                } // HAPPY - GROUPBOX
                .colorScheme(.light)
                
                Spacer()
                
                if day?.title == "" {
                    Spacer()
                } else {
                    
                }
                
            } // BODY - VSTACK
            .padding()
        } // MAIN - ZSTACK
        
        .navigationTitle(day?.title ?? "Details")
    }
}

struct DayDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DayDetailsView()
    }
}
