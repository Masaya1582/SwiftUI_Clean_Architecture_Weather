//
//  WeatherView.swift
//  WeatherCleanApp
//
//  Created by Cookie-san on 2025/09/01.
//

import SwiftUI

struct WeatherView: View {
    @StateObject var viewModel: WeatherViewModel

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                TextField("Enter city name", text: $viewModel.cityName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)

                Button("Get Weather") {
                    Task {
                        await viewModel.fetchWeather()
                    }
                }
                .buttonStyle(.borderedProminent)

                Spacer().frame(height: 48)

                if let weather = viewModel.weather {
                    WeatherCardView(weather: weather)
                } else if viewModel.isLoading {
                    ProgressView()
                } else if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                }
                Spacer()
            }
            .navigationTitle("Weather App")
        }
    }
}
