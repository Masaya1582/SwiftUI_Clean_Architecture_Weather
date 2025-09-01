//
//  WeatherCleanAppApp.swift
//  WeatherCleanApp
//
//  Created by Cookie-san on 2025/09/01.
//

import SwiftUI

@main
struct WeatherCleanAppApp: App {
    var body: some Scene {
        WindowGroup {
            // 依存関係の注入、上位レイヤに向けて注入していく流れ
            // 単方向の依存関係なので、上位レイヤは下位レイヤの詳細を知らなくて良い
            let apiClient = WeatherAPIClient()
            let repository = WeatherRepositoryImpl(apiClient: apiClient)
            let useCase = WeatherUseCase(repository: repository)
            let viewModel = WeatherViewModel(useCase: useCase)
            WeatherView(viewModel: viewModel)
        }
    }
}
