//
//  WeatherAPIClient.swift
//  WeatherCleanApp
//
//  Created by Cookie-san on 2025/09/01.
//

import Foundation

protocol WeatherAPIClientProtocol {
    func fetchWeather(city: String) async throws -> WeatherDTO
}

final class WeatherAPIClient: WeatherAPIClientProtocol {
    private let apiKey = "YOUR_API_KEY" // Open WeatherのAPIキーをここに挿入、実開発ではマスキングするなど、セキュリティに注意
    private let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }

    // 実開発ではAPI通信処理を共通化して、エラーハンドリングやレスポンスのパースを一元管理することよりGOOD
    func fetchWeather(city: String) async throws -> WeatherDTO {
        let encodedCity = city.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? city
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(encodedCity)&appid=\(apiKey)&units=metric") else {
            throw URLError(.badURL)
        }

        let (data, response) = try await session.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }

        let decoded = try JSONDecoder().decode(WeatherDTO.self, from: data)
        return decoded
    }
}
