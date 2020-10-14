//
//  Snow.swift
//  Weather2
//
//  Created by Nicholas Cracchiolo on 10/8/20.
//

import Foundation

struct Snow: Precipitation {
    let volumeLastHour: Int
    let volumeLastThreeHours: Int
    
    enum CodingKeys: String, CodingKey {
        case volumeLastHour = "1h"
        case volumeLastThreeHours = "3h"
    }
}
