//
//  URL+.swift
//  Weather
//
//  Created by Lisandro on 16/08/2020.
//

import Foundation

extension URL {
    static func urlForWeather(_ city: String) -> URL? {
        guard let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=6b4e2f7154aaa8766135ec3f952bc376") else {
            return nil
        }
        return url
    }
}
