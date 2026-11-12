//
//  HotelQuery.swift
//  HotelAppClient
//
//  Created by Mohammad Azam on 10/22/26.
//

import Foundation

struct HotelQuery: Equatable {
    var sort: SortOption?
    var filters: Set<FilterOption> = []
    var pageSize: Int = 10
}
