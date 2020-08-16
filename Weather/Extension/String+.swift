//
//  String+.swift
//  Weather
//
//  Created by Lisandro on 16/08/2020.
//

import Foundation

extension String {
    func escaped() -> String? {
        self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
    }
}
