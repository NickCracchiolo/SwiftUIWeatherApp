//
//  Endpoint.swift
//  Weather2
//
//  Created by Nicholas Cracchiolo on 10/8/20.
//

import Foundation

struct Endpoint: CustomStringConvertible  {
    var path: String
    var body: Data?
    var queryItems = [URLQueryItem]()
    
    var description: String {
        return """
            path: \(path)
            body: \(body)
            queryItems: \(queryItems)
            Request: \(self.makeRequest())
            """
    }
    
    init(path:String, queryItems:[URLQueryItem] = [], body:Data? = nil) {
        self.path = path
        self.queryItems = queryItems
        self.body = body
    }

    func makeRequest() -> URLRequest? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.openweathermap.org"
        components.path = path
        components.queryItems = queryItems

        // If either the path or the query items passed contained
        // invalid characters, we'll get a nil URL back:
        guard let url = components.url else { return nil }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        //request.addValue(token.bearerAuthorization, forHTTPHeaderField: token.header.description)
        request.setValue(ContentType.json.description, forHTTPHeaderField: HTTPHeader.contentType.description)
        request.httpBody = body
        return request
    }
}
