//
//  WeatherUseCaseProtocol.swift
//  WeatherCleanApp
//
//  Created by Cookie-san on 2025/09/01.
//

import Foundation

protocol WeatherUseCaseProtocol {
    func getWeather(for city: String) async throws -> Weather
}

final class WeatherUseCase: WeatherUseCaseProtocol {
    private let repository: WeatherRepository

    init(repository: WeatherRepository) {
        self.repository = repository
    }

    func getWeather(for city: String) async throws -> Weather {
        return try await repository.fetchWeather(for: city)
    }
}
