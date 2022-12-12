//
//  Analysis.swift
//  ObjectDetection
//
//  Created by Carlos Amaral on 20/01/22.
//

import Foundation
import SwiftUI
import CoreML
import Vision

//MARK: NOT WORKING! (The ML is different)
struct Analysis {
    func setData() {
        let path = Bundle.main.path(forResource: "puppy", ofType: "jpg")
        let imageUrl = NSURL.fileURL(withPath: path!)

        // Definir o model ML criado
        let modelFile = YOLOv3()
        let model = try! VNCoreMLModel(for: modelFile.model)

        // Criar o handler
        let handler = VNImageRequestHandler(url: imageUrl)

        // Criar o request
        let request = VNCoreMLRequest(model: model, completionHandler: analysis)

        try! handler.perform([request])

    }
    
    func analysis(request: VNRequest, error: Error?) {
        
        // Armazenar o resultado
        // Usar o guard pq é algo que pode crashar o app (Exatamente o que a gente faz no else)
        guard let result = request.results as? [VNClassificationObservation] else { fatalError("Could not get results from ML Vision request") }
        
        var bestPrediction : String = ""
        var bestConfidence : VNConfidence = 0
        
        for classification in result {
            if(classification.confidence > bestConfidence) {
                bestConfidence = classification.confidence
                bestPrediction = classification.identifier
            }
        }
        
        print("OBJ: \(bestPrediction)")
        print("CONFIDENCE: \(bestConfidence)")
    }
}
