//
//  WeatherbitData.swift
//  MVVMTest
//
//  Created by Prasad More on 18/02/22.
//

import Foundation

struct WeatherbitData: Decodable {
    
    private static let dateFormatter: DateFormatter = {
      var formatter = DateFormatter()
      formatter.dateFormat = "yyyy-MM-dd"
      return formatter
    }()
    
    let observation: [Observation]

    enum CodingKeys: String, CodingKey {
        case observation = "data"
    }
    
    var currentTemp: Double {
        observation[0].temp
    }
    
    var iconName: String {
        observation[0].weather.icon
    }
    
    var description: String {
        observation[0].weather.description
    }
    
    var date: Date {
        let dateString = String(observation[0].dateString.prefix(10))
        return Self.dateFormatter.date(from: dateString) ?? Date()
    }
}

struct Observation: Decodable {
    let temp: Double
    let dateString: String
    let weather: Weather
}

struct Weather: Decodable {
    let icon: String
    let description: String
}
