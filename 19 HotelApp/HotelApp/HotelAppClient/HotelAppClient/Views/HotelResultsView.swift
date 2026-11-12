//
//  HotelResultsView.swift
//  HotelAppClient
//
//  Created by Mohammad Azam on 10/22/26.
//

import SwiftUI

struct HotelResultsView: View {
    
    let hotels: [Hotel]
    let onLoadMore: () async -> Void
    
    var body: some View {
        ForEach(hotels) { hotel in
            HotelCellView(hotel: hotel)
                .task {
                    if hotel.id == hotels.last?.id {
                        await onLoadMore()
                    }
                }
        }
    }
}

#Preview {
    HotelResultsView(hotels: []) {
        
    }
}
