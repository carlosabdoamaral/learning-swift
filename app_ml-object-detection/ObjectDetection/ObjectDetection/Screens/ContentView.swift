//
//  ContentView.swift
//  ObjectDetection
//
//  Created by Carlos Amaral on 20/01/22.
//

import SwiftUI
import Vision

struct ContentView: View {

    @State public var imageName : String = "house.fill"
    @State public var predText = "House"
    @State public var predConfidence : VNConfidence = 0.1
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Image("puppy")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .padding()
                    
                    Text("\(predText)")
                        .font(.title)
                        .fontWeight(.semibold)
                    
                    Text("\(predConfidence)%")
                        .font(.title3)
                        .fontWeight(.ultraLight)
                    
                    Button("Analisar") {
                        //
                    }
                }
            }
            .navigationTitle("Object Detection")
            .navigationBarTitleDisplayMode(.large)
        }
        .preferredColorScheme(.light)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
