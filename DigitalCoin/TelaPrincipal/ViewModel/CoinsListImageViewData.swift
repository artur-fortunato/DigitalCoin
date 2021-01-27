//
//  CoinsListImageViewData.swift
//  DigitalCoin
//
//  Created by Artur Rodrigues Fortunato on 27/01/21.
//

import Foundation

protocol CoinsListImageViewDataType {
    var image: String {get}
}

class CoinsListImageViewData {
    // MARK: - Properts
    private let modelImage: CoinsImage
    // MARK: - Constructors
    init(modelImage: CoinsImage) {
        self.modelImage = modelImage
    }
}
extension CoinsListImageViewData: CoinsListImageViewDataType {
    var image: String {
        return modelImage.url
    }
}
