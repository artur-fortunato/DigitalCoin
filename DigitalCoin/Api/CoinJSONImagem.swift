//
//  CoinJSONImagem.swift
//  testandoAPI
//
//  Created by Aloisio Formento Junior on 22/01/21.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Coin
class WelcomeElement2: Codable {
    let assetID: String?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case assetID = "asset_id"
        case url
    }

    init(assetID: String?, url: String?) {
        self.assetID = assetID
        self.url = url
    }
}

typealias Welcome2 = [WelcomeElement2]
