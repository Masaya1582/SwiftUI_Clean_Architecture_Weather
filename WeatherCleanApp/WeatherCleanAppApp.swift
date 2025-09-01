//
//  WeatherCleanAppApp.swift
//  WeatherCleanApp
//
//  Created by Cookie-san on 2025/09/01.
//

import SwiftUI

@main
struct WeatherCleanAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
