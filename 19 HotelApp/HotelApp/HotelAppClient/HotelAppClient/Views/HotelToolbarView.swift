//
//  HotelToolbarView.swift
//  HotelClientApp
//
//  Created by Mohammad Azam on 10/22/26.
//

import SwiftUI

struct HotelToolbarView: View {

    let pageSize: Int
    let onSort: () -> Void
    let onFilter: () -> Void
    let onPageSizeChange: (Int) -> Void

    var body: some View {
        VStack {
            HStack {
                Button("Filter", action: onFilter)
                    .buttonStyle(.borderless)

                Spacer()

                Button("Sort", action: onSort)
                    .buttonStyle(.borderless)
            }

            PageSizeView(initialPageSize: pageSize) { size in
                onPageSizeChange(size)
            }
        }
    }
}

