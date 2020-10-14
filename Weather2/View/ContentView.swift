//
//  ContentView.swift
//  Weather2
//
//  Created by Nicholas Cracchiolo on 10/6/20.
//

import SwiftUI

struct ContentView: View {
    let accessToken: AccessToken = AccessToken(header: .authorization, devToken: "", userToken: "", httpMethod: .get)
    @ObservedObject var weatherModel: WeatherModel = WeatherModel()
    
    private let numberFormatter: NumberFormatter
    private let measurementFormatter: MeasurementFormatter
    
    init() {
        self.numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 1
        numberFormatter.maximumIntegerDigits = 3
        self.measurementFormatter = MeasurementFormatter()
        self.measurementFormatter.numberFormatter = self.numberFormatter
    }
    
    var body: some View {
        if let weather = self.weatherModel.currentWeather {
            Text(measurementFormatter.string(from: Measurement(value: weather.main.feelsLike, unit: UnitTemperature.fahrenheit)))
            .padding()
        } else {
            Text("Error Getting Weather Data")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
