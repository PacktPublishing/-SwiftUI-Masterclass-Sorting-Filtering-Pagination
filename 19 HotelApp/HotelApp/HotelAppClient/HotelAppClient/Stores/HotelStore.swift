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
    private var currentPage: Int = 1
    private var hasMoreHotels: Bool = true
    private var query = HotelQuery()
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func loadHotels(_ query: HotelQuery) async throws {
        
        let queryChanged = self.query != query
        guard queryChanged || hasMoreHotels else { return }
        
        let page = queryChanged ? 1: currentPage
        
        let resource = Resource(url: Constants.Urls.hotels(query: query, page: page), responseType: [Hotel].self)
        print(resource.url)
        let newHotels = try await httpClient.fetch(resource: resource)
        
        print(newHotels.count)
        
        if page == 1 {
            hotels = newHotels
        } else {
            hotels.append(contentsOf: newHotels)
        }
    
        self.query = query
        
        currentPage = page + 1
        hasMoreHotels = newHotels.count == query.pageSize
    }
    
}
