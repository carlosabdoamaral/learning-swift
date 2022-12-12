//
//  ViewController.swift
//  MLPhoto
//
//  Created by Carlos Amaral on 20/01/22.
//

import UIKit
import CoreML //ML Module
import Vision

class ViewController: UIViewController {

    @IBOutlet var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        self.resultLabel.text = bestPrediction
    }


}

