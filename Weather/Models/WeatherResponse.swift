//
//  WeatherResponse.swift
//  Weather
//
//  Created by Lisandro on 16/08/2020.
//

import Foundation

struct WeatherResponse: Decodable {
    let main: WeatherData
}

struct WeatherData: Decodable {
    let temp: Double
    let humidity: Double
}
