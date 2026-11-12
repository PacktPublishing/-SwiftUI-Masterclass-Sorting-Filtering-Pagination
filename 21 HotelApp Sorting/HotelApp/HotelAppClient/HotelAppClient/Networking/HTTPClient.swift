//
//  ContentView.swift
//  Learn
//
//  Created by Mohammad Azam on 5/27/26.
//

import SwiftUI

enum HTTPMethod {
    case get
    case post(Data)
    case delete
    case put
    
    var rawValue: String {
        switch self {
        case .get:
            "GET"
        case .post:
            "POST"
        case .delete:
            "DELETE"
        case .put:
            "PUT"
        }
    }
    
    var body: Data? {
        switch self {
        case .post(let data):
            data
        default:
            nil
        }
    }
}

struct Resource<T: Decodable> {
    let url: URL
    var method: HTTPMethod = .get
    let responseType: T.Type
}

enum NetworkError: Error {
    case badRequest(Data)
    case unauthorized
    case invalidResponse
    case decodingFailed(Error)
}

struct HTTPClient {
    
    private let session: URLSession
    private let defaultHeaders: [String: String]
    
    init(session: URLSession = .shared, defaultHeaders: [String : String] = ["Content-Type": "application/json"]) {
        self.session = session
        self.defaultHeaders = defaultHeaders
    }
    
    func fetch<T>(resource: Resource<T>) async throws -> T {
        
        var request = URLRequest(url: resource.url)
        request.httpMethod = resource.method.rawValue
        request.allHTTPHeaderFields = defaultHeaders
        request.httpBody = resource.method.body
        
        let (data, response) = try await session.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        switch httpResponse.statusCode {
        case 200...299:
            do {
                return try JSONDecoder().decode(T.self, from: data)
            } catch {
                throw NetworkError.decodingFailed(error)
            }
        case 401:
            throw NetworkError.unauthorized
        case 400...499:
            throw NetworkError.badRequest(data)
        default:
            throw NetworkError.invalidResponse
        }
    }
}

