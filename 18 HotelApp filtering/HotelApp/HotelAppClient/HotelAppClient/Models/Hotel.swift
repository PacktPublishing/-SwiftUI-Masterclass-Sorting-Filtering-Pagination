//
//  Hotel.swift
//  HotelAppClient
//
//  Created by Mohammad Azam on 10/19/26.
//

import Foundation

struct Hotel: Codable, Identifiable {
    let id: Int
    let name: String
    let price: Double
    let breakfast: Bool
    let parking: Bool
    let airportShuttle: Bool
    let wifiIncluded: Bool
    let guestRating: Double
}
