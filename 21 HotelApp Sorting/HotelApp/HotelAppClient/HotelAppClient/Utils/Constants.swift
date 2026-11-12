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
        
        static func hotels(sort: SortOption? = nil) -> URL {
            
            let url = base.appending(path: "hotels")
            
            var queryItems: [URLQueryItem] = []
            
            if let sort {
                queryItems.append(URLQueryItem(name: "sort", value: sort.rawValue))
            }
            
            return url.appending(queryItems: queryItems)
        }
        
    }
    
}
