//
//  HotelStore.swift
//  HotelAppClient
//
//  Created by Mohammad Azam on 10/19/26.
//

import Foundation
import Observation

@Observable
class HotelStore {
    
    private(set) var hotels: [Hotel] = []
    let httpClient: HTTPClient
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func loadHotels(sortOption: SortOption? = nil, filters: Set<FilterOption> = []) async throws {
        let resource = Resource(url: Constants.Urls.hotels(sort: sortOption, filters: filters), responseType: [Hotel].self)
        hotels = try await httpClient.fetch(resource: resource)
    }
    
}
