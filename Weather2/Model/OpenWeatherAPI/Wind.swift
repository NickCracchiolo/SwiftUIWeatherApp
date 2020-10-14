//
//  Wind.swift
//  Weather2
//
//  Created by Nicholas Cracchiolo on 10/8/20.
//

import Foundation

struct Wind: Decodable {
    let speed: Double
    let degree: Int
    let gust: Int?
    
    enum CodingKeys: String, CodingKey {
        case speed
        case degree = "deg"
        case gust
    }
}
