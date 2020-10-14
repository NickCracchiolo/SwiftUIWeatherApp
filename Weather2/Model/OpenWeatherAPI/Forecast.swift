//
//  Forecast.swift
//  Weather2
//
//  Created by Nicholas Cracchiolo on 10/13/20.
//

import Foundation

struct Forecast: Decodable {
    let code: Int
    let message: String
    let count: Int
    let list: []
    let city: City
    
    enum CodingKeys: String, CodingKey {
        case code = "cod"
        case message
        case count = "cnt"
        case list
        case city
    }
}
