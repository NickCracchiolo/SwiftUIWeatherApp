//
//  HTTPMethod.swift
//  Weather2
//
//  Created by Nicholas Cracchiolo on 10/8/20.
//

import Foundation

enum HTTPMethod: String, Codable, CaseIterable, CustomStringConvertible {
    case get = "GET"
    case post = "POST"
    
    public var description: String {
        return self.rawValue
    }
}
