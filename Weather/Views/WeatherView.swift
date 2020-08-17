//
//  WeatherView.swift
//  Weather
//
//  Created by Lisandro on 17/08/2020.
//

import SwiftUI

struct WeatherView: View {
    let temperature: Double
    let humidity: Double
    
    
    var body: some View {
        VStack(spacing: 10) {
            Text("\(temperature)")
                .font(.largeTitle)
                .foregroundColor(.white)
            
            Text("\(humidity)")
                .foregroundColor(.white)
                .opacity(0.7)
        }
        .padding()
        .frame(width: 300, height: 150)
        .background(Color.blue)
        .clipShape(RoundedRectangle(cornerRadius: 8.0, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
    }
}


struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(temperature: 10, humidity: 20)
    }
}
