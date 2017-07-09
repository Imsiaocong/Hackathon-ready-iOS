//
//  ImageDetectionModel.swift
//  LoginSample
//
//  Created by Di Wang on 2017/6/20.
//  Copyright © 2017年 Di Wang. All rights reserved.
//

import UIKit
import CoreML
import Vision
import Foundation

@available(iOS 11.0, *)
class ImageDetectionModel {
    
    var answerText = ""
    
    private func toCIImage(from: UIImage)->CIImage? {
        let image:CIImage! = CIImage(image: from)
        return image
    }
    
    func detectImage(image: UIImage) {
        
        print("Processing...")
        
        let ciImage = toCIImage(from: image)
        
        guard let model = try? VNCoreMLModel(for: Resnet50().model) else {
            fatalError("You fucked Up!")
        }
        
        let request = VNCoreMLRequest(model: model) { [weak self] request, error in
            //Additional functionalities...
            guard let res = request.results as? [VNClassificationObservation],
                let topResult = res.first else {
                    fatalError()
            }
            
            self?.answerText = "\(topResult.identifier)"
        }
        
        let handler = VNImageRequestHandler(ciImage: ciImage!)
        DispatchQueue.global(qos: .userInteractive).async {
            do {
                try handler.perform([request])
            } catch {
                print(error)
            }
        }
    }
}
