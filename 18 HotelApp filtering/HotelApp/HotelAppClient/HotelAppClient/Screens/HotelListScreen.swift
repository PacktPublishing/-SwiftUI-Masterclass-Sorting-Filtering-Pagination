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
    @State private var activeSheet: Sheet?
    @State private var selectedFilters: Set<FilterOption> = []
    
    private enum Sheet: Identifiable {
        case filter
        case sort
        
        var id: Self { self }
    }
    
    var body: some View {
        List {
            
            HStack {
                
                Button("Filter") {
                    activeSheet = .filter
                }.buttonStyle(.borderless)
                
                Spacer()
                
                Button("Sort") {
                    activeSheet = .sort
                }.buttonStyle(.borderless)
            }
            
            ForEach(hotelStore.hotels) { hotel in
                HotelCellView(hotel: hotel)
            }
        }
        .sheet(item: $activeSheet, content: { sheet in
            switch sheet {
            case .sort:
                SortView(initialSelection: selectedSortOption) { option in
                    selectedSortOption = option
                    Task { await loadHotels() }
                }.presentationDetents([.fraction(0.25)])
                
            case .filter:
                FilterView(initialFilters: selectedFilters) { filters in
                    self.selectedFilters = filters
                    Task { await loadHotels() }
                }.presentationDetents([.fraction(0.25)])  
            }
        })
        .task {
            await loadHotels()
        }.navigationTitle("Hotels")
    }
    
    private func loadHotels() async {
        do {
            try await hotelStore.loadHotels(sortOption: selectedSortOption, filters: selectedFilters)
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
