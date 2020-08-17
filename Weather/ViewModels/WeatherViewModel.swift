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

class WeatherViewModel: ObservableObject {
    @Published private var weather: WeatherData?
    @Published var city: String = ""
    @Published var message: String = ""
    @Published var loadingState: LoadingState = .none
    
    var temperature: Double {
        weather?.temp ?? 0.0
    }
    
    var humidity: Double {
        weather?.humidity ?? 0.0
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
