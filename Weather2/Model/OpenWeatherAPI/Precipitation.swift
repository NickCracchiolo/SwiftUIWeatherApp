//
//  Precipitation.swift
//  Weather2
//
//  Created by Nicholas Cracchiolo on 10/8/20.
//

import Foundation

protocol Precipitation: Decodable {
    var volumeLastHour: Int { get }
    var volumeLastThreeHours: Int { get }
}
