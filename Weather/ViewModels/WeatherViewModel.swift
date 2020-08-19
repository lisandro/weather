//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Lisandro on 16/08/2020.
//

import Foundation

enum LoadingState {
    case loading
    case success
    case failed
    case none
}

enum TemperatuerUnit: String, CaseIterable {
    case fahrenheit
    case celsius
}

extension TemperatuerUnit {
    var title: String {
        switch self {
        case .fahrenheit:
            return "Fahrenheit"
        case .celsius:
            return "Celsius"
        }
    }
}

class WeatherViewModel: ObservableObject {
    @Published private var weather: WeatherData?
    @Published var city: String = ""
    @Published var message: String = ""
    @Published var loadingState: LoadingState = .none
    @Published var temperatureUnit: TemperatuerUnit = .celsius

    var temperature: String {
        guard let temp = weather?.temp else {
            return "N/A"
        }

        switch temperatureUnit {
        case .fahrenheit:
            return String(format: "%.0F F", temp.toFahrenheit())
        case .celsius:
            return String(format: "%.0F C", temp.toCelsius())
        }
    }
    
    var humidity: String {
        guard let humidity = weather?.humidity else {
            return "N/A"
        }
        return String(format: "%.0F %%", humidity)
    }
    
    func fetchWeather() {
        guard let city = city.escaped() else {
            DispatchQueue.main.async {
                self.message = "City is incorrect"
            }
            return
        }
        self.loadingState = .loading
        WeatherService().getWeather(city: city) { result in
            switch result {
            case .success(let weather):
                DispatchQueue.main.async {
                    self.weather = weather
                    self.loadingState = .success
                }
            case .failure:
                DispatchQueue.main.async {
                    self.message = "Unable to find the weather"
                    self.loadingState = .failed
                }
            }
        }
    }
}
