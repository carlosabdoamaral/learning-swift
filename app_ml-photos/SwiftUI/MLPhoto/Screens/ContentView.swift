//
//  ContentView.swift
//  MLPhoto
//
//  Created by Carlos Amaral on 20/01/22.
//

import SwiftUI
import CoreML //ML Module
import Vision //Image

struct ContentView: View {
    
    @State private var text : String = ""
    @State private var pred : String = ""
    
    func analisar() {
        let path = Bundle.main.path(forResource: "puppy", ofType: "jpg")
        let imageURL = NSURL.fileURL(withPath: path!)
        let modelFile = Resnet50()
        let model = try! VNCoreMLModel(for: modelFile.model)
        let handler = VNImageRequestHandler(url: imageURL)
        let request = VNCoreMLRequest(model: model, completionHandler: resultMethod)
        
        try! handler.perform([ request ])
    }
    
    func resultMethod(request: VNRequest, error: Error?) {
        guard let result = request.results as? [VNClassificationObservation] else { fatalError("Could not get results from ML Vision request") }
        
        var bestPrediction : String = ""
        var bestConfidence : VNConfidence = 0
        
        for classification in result {
            if (classification.confidence > bestConfidence) {
                bestConfidence = classification.confidence
                bestPrediction = classification.identifier
            }
        }
        
        print("Best: \(bestPrediction)")
        print("Confidence: \(bestConfidence)")
        self.text = bestPrediction
        let confidenceAjustada = bestConfidence * 100
        self.pred = "\(confidenceAjustada)%"
        
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Image("puppy")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                    
                    VStack {
                        Text("\(self.text)")
                            .font(.title)

                        Text("\(self.pred)")
                            .font(.title3)
                            .fontWeight(.ultraLight)
                        }
                    .padding()
                        
                    Button("Analisar") { analisar() }
                }
            }
            .navigationTitle("ML Photo")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
