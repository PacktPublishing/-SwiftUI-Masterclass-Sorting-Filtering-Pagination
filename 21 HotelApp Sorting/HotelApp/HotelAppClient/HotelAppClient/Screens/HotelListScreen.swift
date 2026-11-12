//
//  HotelListScreen.swift
//  HotelAppClient
//
//  Created by Mohammad Azam on 10/19/26.
//

import SwiftUI

struct HotelListScreen: View {
    
    @Environment(HotelStore.self) private var hotelStore
    @State private var showSortOptions: Bool = false
    @State private var selectedSortOption: SortOption?
    
    var body: some View {
        List {
            
            Button("Sort") {
                showSortOptions = true
            }
            
            ForEach(hotelStore.hotels) { hotel in
                HotelCellView(hotel: hotel)
            }
        }
        .sheet(isPresented: $showSortOptions, content: {
            SortView(initialSelection: selectedSortOption) { option in
                selectedSortOption = option
                Task { await loadHotels() }
            }.presentationDetents([.fraction(0.25)])
        })
        .task {
            await loadHotels()
        }.navigationTitle("Hotels")
    }
    
    private func loadHotels() async {
        do {
            try await hotelStore.loadHotels(sortOption: selectedSortOption)
        } catch {
            print(error.localizedDescription)
        }
    }
}

#Preview {
    NavigationStack {
        HotelListScreen()
    }.environment(HotelStore(httpClient: HTTPClient()))
}
