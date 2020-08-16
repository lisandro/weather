//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Lisandro on 16/08/2020.
//

import Foundation

class WeatherViewModel: ObservableObject {
    @Published private var weather: Weather?
    @Published var city: String = ""
    
    @Published var message: String = ""
    
    var temperature: Double {
        weather?.temp ?? 0.0
    }
    
    func fetchWeather() {
        guard let city = city.escaped() else {
            fatalError("URL is invalid!")
        }
        WeatherService().getWeather(city: city) { result in
            switch result {
            case .success(let weather):
                print("ok")
                DispatchQueue.main.async {
                    self.weather = weather
                }
            case .failure:
                DispatchQueue.main.async {
                    self.message = "Unable to find the weather"
                    self.weather = nil
                }
            }
        }
    }
}
