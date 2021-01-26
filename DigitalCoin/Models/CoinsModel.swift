//
//  CoinsModel.swift
//  DigitalCoin
//
//  Created by Fabricio Rodrigo Baixo on 1/25/21.
//

import Foundation

struct CoinsModel : Codable {
    
    let id : String?
    let name : String?
    let lastHour : Double?
    let lastDay : Double?
    let lastMonth : Double?
    let priceUsd : Double?
    let completed : Bool?
    
    enum CodingKeys: String,CodingKey{
        case id = "asset_id"
        case name = "name"
        case lastHour = "volume_1hrs_usd"
        case lastDay = "volume_1day_usd"
        case lastMonth = "volume_1mth_usd"
        case priceUsd = "price_usd"
        case completed = "completed"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        lastHour = try values.decodeIfPresent(Double.self, forKey: .lastHour)
        lastDay = try values.decodeIfPresent(Double.self, forKey: .lastDay)
        lastMonth = try values.decodeIfPresent(Double.self, forKey: .lastMonth)
        priceUsd = try values.decodeIfPresent(Double.self, forKey: .priceUsd)
        completed = try values.decodeIfPresent(Bool.self, forKey: .completed)
    }
    
}
