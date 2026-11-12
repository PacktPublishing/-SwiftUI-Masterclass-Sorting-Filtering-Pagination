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
    private var sortOption: SortOption?
    private var filters: Set<FilterOption> = []
    private var pageSize: Int = 10
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func loadHotels(sortOption: SortOption? = nil, filters: Set<FilterOption> = [], pageSize: Int) async throws {
        
        let queryChanged = sortOption != self.sortOption || filters != self.filters || pageSize != self.pageSize
        
        guard queryChanged || hasMoreHotels else { return }
        
        let page = queryChanged ? 1: currentPage
        
        let resource = Resource(url: Constants.Urls.hotels(sort: sortOption, filters: filters, page: page, pageSize: pageSize), responseType: [Hotel].self)
        print(resource.url)
        let newHotels = try await httpClient.fetch(resource: resource)
        
        print(newHotels.count)
        
        if page == 1 {
            hotels = newHotels
        } else {
            hotels.append(contentsOf: newHotels)
        }
        
        self.sortOption = sortOption
        self.filters = filters
        self.pageSize = pageSize
        
        currentPage = page + 1
        hasMoreHotels = newHotels.count == pageSize
    }
    
}
