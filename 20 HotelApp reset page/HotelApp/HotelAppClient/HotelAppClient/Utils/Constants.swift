//
//  Constants.swift
//  HotelAppClient
//
//  Created by Mohammad Azam on 10/19/26.
//

import Foundation

struct Constants {
    
    struct Urls {
        
        static let base = URL(string: "http://localhost:8080/api/")!
        
        static func hotels(sort: SortOption? = nil, filters: Set<FilterOption> = [], page: Int = 1, pageSize: Int = 10) -> URL {
            
            let url = base.appending(path: "hotels")
            
            var queryItems: [URLQueryItem] = [
                URLQueryItem(name: "page", value: String(page)),
                URLQueryItem(name: "limit", value: String(pageSize))
            ]
            
            if let sort {
                queryItems.append(URLQueryItem(name: "sort", value: sort.rawValue))
            }
            
            for option in filters {
                queryItems.append(URLQueryItem(name: option.rawValue, value: "true"))
            }
            
            return url.appending(queryItems: queryItems)
        }
        
    }
    
}
