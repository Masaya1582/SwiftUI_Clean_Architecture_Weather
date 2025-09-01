//
//  WeatherDTO.swift
//  WeatherCleanApp
//
//  Created by Cookie-san on 2025/09/01.
//

import Foundation

struct WeatherDTO: Decodable {
    let name: String
    let main: Main
    let weather: [WeatherInfo]

    struct Main: Decodable {
        let temp: Double
    }

    struct WeatherInfo: Decodable {
        let description: String
    }
}

extension WeatherDTO {
    func toDomain() -> Weather {
        Weather(
            cityName: name,
            temperature: main.temp,
            description: weather.first?.description ?? "No description"
        )
    }
}
