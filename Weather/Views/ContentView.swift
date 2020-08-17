//
//  ContentView.swift
//  Weather
//
//  Created by Lisandro on 16/08/2020.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var weatherVM: WeatherViewModel
    
    init(weatherVM: WeatherViewModel = WeatherViewModel()) {
        self.weatherVM = weatherVM
    }
    
    var body: some View {
        VStack {
            TextField("Search", text: $weatherVM.city, onEditingChanged: { _ in }) {
                self.weatherVM.fetchWeather()
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            Spacer()
            if self.weatherVM.loadingState == .loading {
                LoadingView()
            } else if self.weatherVM.loadingState == .success {
                WeatherView(temperature: self.weatherVM.temperature, humidity: self.weatherVM.humidity)
            } else if self.weatherVM.loadingState == .failed {
                ErrorView(message: weatherVM.message)
            }
            Spacer()
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = WeatherViewModel()
        vm.loadingState = .loading
        vm.message = ""
        return ContentView(weatherVM: vm)
    }
}
