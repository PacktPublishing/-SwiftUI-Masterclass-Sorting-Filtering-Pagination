//
//  HotelCellView.swift
//  HotelClientApp
//
//  Created by Mohammad Azam on 10/12/26.
//

import SwiftUI

struct HotelCellView: View {

    let hotel: Hotel

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {

            HStack(alignment: .top) {
                Text(hotel.name)
                    .font(.headline)

                Spacer()

                VStack(alignment: .trailing, spacing: 2) {
                    Text(
                        hotel.price,
                        format: .currency(code: "USD")
                            .precision(.fractionLength(0))
                    )
                    .font(.headline)

                    Text("per night")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }

            HStack(spacing: 16) {
                if hotel.breakfast {
                    Label("Breakfast included", systemImage: "fork.knife")
                }

                if hotel.parking {
                    Label("Free parking", systemImage: "car.fill")
                }
            }
            .font(.caption)
            .foregroundStyle(.secondary)

            HStack(spacing: 5) {
                Image(systemName: "star.fill")

                Text("\(hotel.guestRating, specifier: "%.1f")")

                Text("Guest Rating")
                    .foregroundStyle(.secondary)
            }
            .font(.caption)
            .fontWeight(.medium)
        }
        .padding(.vertical, 8)
    }
}

