//
//  FoodTruckApp.swift
//  FoodTruck
//
//  Created by Adrián Silva on 15/6/24.
//

import FirebaseCore
import SwiftUI

@main
struct FoodTruckApp: App {
    
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
