//
//  FoodTruckModel.swift
//  FoodTruck
//
//  Created by Adrián Silva on 17/6/24.
//

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
        []
    }
    
    var appVersionNumber: String {
        "canary_wolf"
    }
    
    init(
        donuts: [Donut] = Donut.all, 
        favouriteDonuts: [Int : Donut] = [:]
    ) {
        self.donuts = favouriteDonuts
        self.favouriteDonuts = favouriteDonuts
    }
    
    func isFavourite(donut: Donut) -> Bool {
        return false
    }
    
    func toggleFavourite(donut: Donut) {
        
    }
    
    func settingsButtonTapped() {

    }
    
    func donutsCardTapped() {

    }
    
    func handlePremiumAnalytics() {

    }
    
    func configureFirebase() {

    }
}
