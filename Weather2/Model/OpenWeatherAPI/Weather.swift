//
//  Weather.swift
//  Weather2
//
//  Created by Nicholas Cracchiolo on 10/8/20.
//

import Foundation

struct Weather: Decodable {
    let id:Int
    let main: String
    let description: String
    let icon: String
}
