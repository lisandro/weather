//
//  ContentView.swift
//  Weather
//
//  Created by Lisandro on 16/08/2020.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var weatherVM = WeatherViewModel()
    
    var body: some View {
        VStack {
            TextField("Search", text: $weatherVM.city, onEditingChanged: { _ in }) {
                self.weatherVM.fetchWeather()
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            Spacer()
            Text("\(self.weatherVM.temperature)")
            Spacer()
            Text(weatherVM.message)
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
