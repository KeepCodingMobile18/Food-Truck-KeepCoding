//
//  FoodTruckModel.swift
//  FoodTruck
//
//  Created by Adrián Silva on 17/6/24.
//

import FirebaseCrashlytics
import FirebaseAnalytics
import SwiftUI

@Observable
final class FoodTruckModel {
    var donuts: [Int: Donut]
    var favouriteDonuts: [Int: Donut] = [:]
    var isPremiumUser = false {
        didSet {
            handlePremiumAnalytics()
        }
    }
    let userID = "my_user_id"
    var isSettingsPresented = false
    var searchText = ""
    var filteredDonuts: [Donut] {
        Array(
            donuts
                .filter { $0.value.matches(searchText: searchText) }
                .values
        )
        .sorted { $0.id < $1.id }
    }
    
    var appVersionNumber: String {
        "canary_wolf"
    }
    
    init(
        donuts: [Donut] = Donut.all, 
        favouriteDonuts: [Int : Donut] = [:]
    ) {
        self.donuts = Dictionary(
            uniqueKeysWithValues: donuts.map { ($0.id, $0) }
        )
        self.favouriteDonuts = favouriteDonuts
        configureFirebase()
    }
    
    func isFavourite(donut: Donut) -> Bool {
        if let _ = favouriteDonuts[donut.id] {
            return true
        }
        return false
    }
    
    func toggleFavourite(donut: Donut) {
//        let foo = favouriteDonuts.values.first!
        if isFavourite(donut: donut) {
            favouriteDonuts.removeValue(forKey: donut.id)
            Analytics.logEvent(
                "donut_toggle_favourite", 
                parameters: [
                    "donut_id": donut.id,
                    "donut_name": donut.name,
                    // En vez de pasar 0 y 1 a Firebase
                    // Se leeria en la consola como true o false
                    "is_favourite": false.description
                ]
            )
            Crashlytics.crashlytics().log("Expected to find a favourite donut")
            let foo = favouriteDonuts.values.first!
            return
        }
        favouriteDonuts[donut.id] = donut
        Analytics.logEvent(
            "donut_toggle_favourite", 
            parameters: [
                "donut_id": donut.id,
                "donut_name": donut.name,
                "is_favourite": true.description
            ]
        )
        Crashlytics.crashlytics().log("Expected to add a favourite donut")
    }
    
    func settingsButtonTapped() {

    }
    
    func donutsCardTapped() {
        Analytics.logEvent(
            "donut_card_tapped", 
            parameters: [
                "favourite_donuts_count": favouriteDonuts.values.count,
                "donuts_count": donuts.values.count
            ]
        )
    }
    
    func handlePremiumAnalytics() {
        Analytics.logEvent(
            "premium_toggle", 
            parameters: [
                "toggle_value": isPremiumUser.description
            ]
        )
    }
    
    func configureFirebase() {
        Analytics.setUserID(userID)
        Analytics.setUserProperty(isPremiumUser.description, forName: "is_premium")
    }
}
