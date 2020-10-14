//
//  WeatherView.swift
//  Weather2
//
//  Created by Nicholas Cracchiolo on 10/8/20.
//

import SwiftUI

struct WeatherView: View {
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
        VStack(alignment: .center) {
            Text("Feels Like")
                .padding(.top)
            Text(measurementFormatter.string(from: Measurement(value: 56.3, unit: UnitTemperature.fahrenheit)))
                .font(.title)
                .bold()
                .padding()
            Text("Dublin, CA")
            VStack {
                HStack {
                    Text("Low")
                        .bold()
                        .padding([.leading, .top])
                    Spacer()
                    Text("High")
                        .bold()
                        .padding([.trailing, .top])
                }
                HStack {
                    Text(measurementFormatter.string(from: Measurement(value: 46.1, unit: UnitTemperature.fahrenheit)))
                        .padding(.leading)
                    Spacer()
                    Text(measurementFormatter.string(from: Measurement(value: 72.9, unit: UnitTemperature.fahrenheit)))
                        .padding(.trailing)
                }
            }
            Spacer()
            List {
            WeatherDayView(temps: [10,20,30,40,45,47,50,47,43,40,37],
                           precipChance: [14,13,12,11,10,9,8,33,35,40,33,8])
            }
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
            //.environment(\.colorScheme, .dark)
    }
}
