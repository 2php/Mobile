//
//  ImageRecognizer.swift
//  SSDDemo
//
//  Created by Nicky Chan on 11/7/17.
//  Copyright © 2017 PaddlePaddle. All rights reserved.
//

import Foundation

protocol ImageRecognizerDelegate {
    func imageRecognizedSuccess(_ result: SSDData)
    func imageRecognizedError()
}

class ImageRecognizer {
    
    var imageRecognizer: ImageRecognizerPaddleWrapper?
    
    init() {
        imageRecognizer = ImageRecognizerPaddleWrapper()
    }
    
    func inference() {
        imageRecognizer?.inference()
    }
    
    func release() {
        imageRecognizer?.destroy()
    }
    
}




