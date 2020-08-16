//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Lisandro on 16/08/2020.
//

import Foundation

class WeatherViewModel: ObservableObject {
    @Published private var weather: Weather?
     
    var temperature: Double {
        guard let temp = weather?.temp else {
            return 0.0
        }
        return temp
    }
    
    func fetchWeather() {
        WeatherService().getWeather { result in
            switch result {
            case .success(let weather):
                print("ok")
                DispatchQueue.main.async {
                    self.weather = weather
                }
            case .failure:
                print("bad")
            }
        }
    }
}
