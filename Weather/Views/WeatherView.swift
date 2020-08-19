//
//  WeatherView.swift
//  Weather
//
//  Created by Lisandro on 17/08/2020.
//

import SwiftUI

struct WeatherView: View {
    @ObservedObject var weatherVM: WeatherViewModel
    var body: some View {
        VStack(spacing: 10) {
            Text(self.weatherVM.temperature)
                .font(.largeTitle)
                .foregroundColor(.white)
            
            Text(self.weatherVM.humidity)
                .foregroundColor(.white)
                .opacity(0.7)

            Picker(selection: self.$weatherVM.temperatureUnit, label: Text("Select a Unit"), content: {
                ForEach(TemperatuerUnit.allCases, id: \.self) { unit in
                    Text(unit.title)
                }
            }).pickerStyle(SegmentedPickerStyle())
        }
        .padding()
        .frame(width: 300, height: 150)
        .background(Color.blue)
        .clipShape(RoundedRectangle(cornerRadius: 8.0, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
    }
}


struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weatherVM: WeatherViewModel())
    }
}
