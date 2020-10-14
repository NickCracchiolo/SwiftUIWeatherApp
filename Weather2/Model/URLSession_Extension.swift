//
//  URLSession_Extension.swift
//  Weather2
//
//  Created by Nicholas Cracchiolo on 10/6/20.
//

import Foundation
import Combine

extension URLSession {
    static func request<T: Decodable>(onEndpoint endpoint:Endpoint) -> AnyPublisher<T, Error> {
        guard let request = endpoint.makeRequest() else { fatalError("Could not make request") }
        print(endpoint)
        return URLSession.shared.dataTaskPublisher(for: request).tryMap { result -> T in
            let response = try? JSONSerialization.jsonObject(with: result.data, options: [])
            print(response)
            return try JSONDecoder().decode(T.self, from: result.data)
        }
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
}
