//
//  Apple.swift
//  MovieSearch
//
//  Created by Oscar Hinojosa on 2/14/24.
//

import Foundation

struct Apple: Codable, Identifiable{
    var id = UUID()
    let addOn: String
    let leaving: Int
    let price: Price?
    let quality: String
    let type: String
    
    private enum CodingKeys: String, CodingKey {
        case addOn, leaving, price,quality, type
    }
}