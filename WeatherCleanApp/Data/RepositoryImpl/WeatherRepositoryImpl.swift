//
//  WeatherRepositoryImpl.swift
//  WeatherCleanApp
//
//  Created by Cookie-san on 2025/09/01.
//

import Foundation

final class WeatherRepositoryImpl: WeatherRepository {
    private let apiClient: WeatherAPIClientProtocol

    init(apiClient: WeatherAPIClientProtocol) {
        self.apiClient = apiClient
    }

    func fetchWeather(for city: String) async throws -> Weather {
        let dto = try await apiClient.fetchWeather(city: city)
        return dto.toDomain()
    }
}
