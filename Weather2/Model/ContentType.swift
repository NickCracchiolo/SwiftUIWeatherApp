//
//  ContentType.swift
//  Weather2
//
//  Created by Nicholas Cracchiolo on 10/8/20.
//

import Foundation

public enum ContentType: String, Codable, CaseIterable, CustomStringConvertible {
    case json = "applicaiton/json"
    
    public var description: String {
        return self.rawValue
    }
}
