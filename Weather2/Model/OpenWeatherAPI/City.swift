//
//  City.swift
//  Weather2
//
//  Created by Nicholas Cracchiolo on 10/13/20.
//

import Foundation

struct City: Decodable {
    let id: Int
    let name: String
    let coordinates: Coordinates
    let country: String
    let timezone: Int
    let sunrise: Int
    let sunset: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case coordinates = "coord"
        case country
        case timezone
        case sunrise
        case sunset
    }
}
