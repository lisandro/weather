//
//  LoadingView.swift
//  Weather
//
//  Created by Lisandro on 17/08/2020.
//

import SwiftUI


struct LoadingView: View {
    var body: some View {
        VStack {
            Text("Loading your amazing weather!")
                .font(.body)
                .foregroundColor(.white)
        }
        .padding()
        .frame(width: 300, height: 150)
        .background(Color.orange)
        .clipShape(RoundedRectangle(cornerRadius: 8.0))
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
