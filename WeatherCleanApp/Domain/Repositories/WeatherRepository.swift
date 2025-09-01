//
//  WeatherRepository.swift
//  WeatherCleanApp
//
//  Created by Cookie-san on 2025/09/01.
//

import Foundation

protocol WeatherRepository {
    func fetchWeather(for city: String) async throws -> Weather
}
