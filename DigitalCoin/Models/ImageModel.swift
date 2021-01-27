//
//  ImageModel.swift
//  DigitalCoin
//
//  Created by Artur Rodrigues Fortunato on 27/01/21.
//

import Foundation

// MARK: - WelcomeElement
struct CoinsImage: Codable {
    let assetID: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case assetID = "asset_id"
        case url
    }
}

typealias WelcomeImage = [CoinsImage]
