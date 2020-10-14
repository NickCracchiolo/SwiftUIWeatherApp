//
//  AccessToken.swift
//  Weather2
//
//  Created by Nicholas Cracchiolo on 10/8/20.
//

import Foundation

public struct AccessToken {
    let header:HTTPHeader
    let devToken: String
    let userToken: String
    let httpMethod: HTTPMethod
    
    var basicAuthorization: String {
        return "Basic \(userToken)"
    }
    
    var bearerAuthorization: String {
        return "Bearer \(userToken)"
    }
    
    var idAuthorization: String {
        return "ID \(userToken)"
    }
}
