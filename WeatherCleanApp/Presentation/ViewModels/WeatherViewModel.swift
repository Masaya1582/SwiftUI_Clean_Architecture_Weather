//
//  WeatherViewModel.swift
//  WeatherCleanApp
//
//  Created by Cookie-san on 2025/09/01.
//

import Foundation

final class WeatherViewModel: ObservableObject {
    @Published var cityName: String = ""
    @Published var weather: Weather?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    private let useCase: WeatherUseCaseProtocol

    init(useCase: WeatherUseCaseProtocol) {
        self.useCase = useCase
    }

    @MainActor
    func fetchWeather() async {
        guard !cityName.isEmpty else {
            errorMessage = "Please enter a city name"
            return
        }

        isLoading = true
        errorMessage = nil
        do {
            let result = try await useCase.getWeather(for: cityName)
            weather = result
        } catch {
            errorMessage = "Failed to fetch weather 😢"
            print("Error: \(error.localizedDescription)")
        }
        isLoading = false
    }
}

