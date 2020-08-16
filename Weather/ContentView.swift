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
        Text("\(self.weatherVM.temperature)")
            .padding()
            .onAppear(perform: {
                self.weatherVM.fetchWeather()
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
