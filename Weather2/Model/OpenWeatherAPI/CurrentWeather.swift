//
//  CurrentWeather.swift
//  Weather2
//
//  Created by Nicholas Cracchiolo on 10/8/20.
//

import Foundation

struct CurrentWeather: Decodable {
    ///City geo location in longitude and latitude
    let coordinates: Coordinates
    /// More info on Weather condition codes
    let weather: [Weather]
    let base: String
    let main: CurrentWeather.Main
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let rain: Rain?
    let snow: Snow?
    let dt: Int
    let system: CurrentWeather.System
    let timezone: Int
    let id: Int
    let name: String
    let code: Int
    
    struct Main: Decodable {
        let temperature: Double
        let feelsLike: Double
        let minTemp: Double
        let maxTemp: Double
        let pressure: Int
        let humidity: Int
        let seaLevel: Int?
        let groundLevel: Int?
        
        enum CodingKeys: String, CodingKey {
            case temperature = "temp"
            case feelsLike = "feels_like"
            case minTemp = "temp_min"
            case maxTemp = "temp_max"
            case pressure
            case humidity
            case seaLevel = "sea_level"
            case groundLevel = "grnd_level"
        }
    }
    
    struct System: Decodable {
        let type: Int
        let id: Int
        let message: String?
        let country: String
        let sunrise: Int
        let sunset: Int
    }
    
    enum CodingKeys: String, CodingKey {
        case coordinates = "coord"
        case weather
        case base
        case main
        case visibility
        case wind
        case clouds
        case rain
        case snow
        case dt
        case system = "sys"
        case timezone
        case id
        case name
        case code = "cod"
    }
}
