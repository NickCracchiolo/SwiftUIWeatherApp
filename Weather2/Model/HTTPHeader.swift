//
//  HTTPHeader.swift
//  Weather2
//
//  Created by Nicholas Cracchiolo on 10/8/20.
//

import Foundation

public enum HTTPHeader: String, Codable, CaseIterable, CustomStringConvertible {
    case authorization = "Authorization"
    case musicUserToken = "Music-User-Token"
    case contentType = "Content-Type"
    case connection = "Connection"
    case cacheControl = "Cache-Control"
    case acceptEncoding = "Accept-Encoding"
    
    public var description: String {
        return self.rawValue
    }
}
