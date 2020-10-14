//
//  WeatherModel.swift
//  Weather2
//
//  Created by Nicholas Cracchiolo on 10/6/20.
//

import Combine
import Foundation

class WeatherModel: ObservableObject {
    @Published var currentWeather: CurrentWeather?
    var cancellationToken: AnyCancellable?
    
    init() {
        getCurrentWeather()
    }
    
    func getCurrentWeather() {
        let endpoint = Endpoint(path: "/data/2.5/weather",
                                queryItems: [
                                    URLQueryItem(name: "q", value: "dublin,CA,us"),
                                    URLQueryItem(name: "appid", value: "")
                                ],
                                body: nil)
        self.cancellationToken = URLSession.request(onEndpoint: endpoint)
        .mapError({ (error) -> Error in
            print(error)
            return error
        })
        .sink(receiveCompletion: { _ in },
              receiveValue: {
                self.currentWeather = $0.self
        })
        
    }
}

