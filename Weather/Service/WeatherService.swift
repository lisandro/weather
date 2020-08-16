//
//  WeatherService.swift
//  Weather
//
//  Created by Lisandro on 16/08/2020.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case noData
    case decodingError
}

class WeatherService {
    
    func getWeather(city: String, completion: @escaping (Result<Weather?, NetworkError>) -> Void) {
        guard let url = URL.urlForWeather(city) else {
            return completion(.failure(.badUrl))
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                return completion(.failure(.badUrl))
            }
            
            let weatherRespone = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            if let weatherRespone = weatherRespone {
                completion(.success(weatherRespone.main))
            } else {
                completion(.failure(.decodingError))
            }
        }.resume()


    }
}
