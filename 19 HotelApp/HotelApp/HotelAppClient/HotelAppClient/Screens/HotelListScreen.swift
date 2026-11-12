//
//  HotelListScreen.swift
//  HotelAppClient
//
//  Created by Mohammad Azam on 10/19/26.
//

import SwiftUI

struct HotelListScreen: View {
    
    @Environment(HotelStore.self) private var hotelStore
    @State private var activeSheet: Sheet?
    @State private var query = HotelQuery()
    
    @State private var loadingPhase: LoadingPhase = .loading
    
    private enum Sheet: Identifiable {
        case filter
        case sort
        
        var id: Self { self }
    }
    
    private enum LoadingPhase {
        case loading
        case success
        case failure(Error)
    }
    
    var body: some View {
        
        Group {
            switch loadingPhase {
            case .loading:
                ProgressView("Hotels are loading...")
            case .success:
                if hotelStore.hotels.isEmpty {
                    ContentUnavailableView {
                        Label("No Hotels Found", systemImage: "building.2")
                    } description: {
                        Text("No hotels match your search criteria.")
                    } actions: {
                        Button(query.filters.isEmpty ? "Refresh": "Clear Filters") {
                            query.filters.removeAll()
                            query.sort = nil
                            Task { await loadHotels() }
                        }
                    }
                } else {
                    hotelList
                }
            case .failure(let error):
                ContentUnavailableView(
                    "Unable to Load Hotels",
                    systemImage: "exclamationmark.triangle",
                    description: Text(error.localizedDescription))
            }
        }
        .sheet(item: $activeSheet, content: { sheet in
            switch sheet {
            case .sort:
                SortView(initialSelection: query.sort) { option in
                    query.sort = option
                    Task { await loadHotels() }
                }.presentationDetents([.fraction(0.25)])
                
            case .filter:
                FilterView(initialFilters: query.filters) { filters in
                    query.filters = filters
                    Task { await loadHotels() }
                }.presentationDetents([.fraction(0.25)])
            }
        })
        .task {
            await loadHotels()
        }.navigationTitle("Hotels")
    }
     
    private var hotelList: some View {
        List {
            HotelToolbarView(pageSize: query.pageSize) {
                activeSheet = .sort
            } onFilter: {
                activeSheet = .filter
            } onPageSizeChange: { size in
                query.pageSize = size
                Task { await loadHotels() }
            }
            
            HotelResultsView(hotels: hotelStore.hotels) {
                await loadHotels()
            }
        }
    }
    
    
    private func loadHotels() async {
        do {
            try await hotelStore.loadHotels(query)
            loadingPhase = .success
        } catch {
            if hotelStore.hotels.isEmpty {
                loadingPhase = .failure(error)
            } else {
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    NavigationStack {
        HotelListScreen()
    }.environment(HotelStore(httpClient: HTTPClient()))
}
