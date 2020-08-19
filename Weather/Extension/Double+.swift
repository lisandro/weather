//
//  Double+.swift
//  Weather
//
//  Created by Lisandro on 19/08/2020.
//

import Foundation

extension Double {
    func toFahrenheit() -> Double {
        let temperature = Measurement<UnitTemperature>(value: self, unit: .kelvin)
        return temperature.converted(to: .fahrenheit).value
    }

    func toCelsius() -> Double {
        let temperature = Measurement<UnitTemperature>(value: self, unit: .kelvin)
        return temperature.converted(to: .celsius).value
    }
}
