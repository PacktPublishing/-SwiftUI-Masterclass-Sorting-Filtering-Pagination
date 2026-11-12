//
//  PageView.swift
//  HotelClientApp
//
//  Created by Mohammad Azam on 10/16/26.
//

import SwiftUI

struct PageSizeView: View {

    @State private var selectedPageSize = 10
    let onSelect: (Int) -> Void

    private let pageSizes = [5, 10, 15, 20]
    
    init(initialPageSize: Int, onSelect: @escaping (Int) -> Void) {
        _selectedPageSize = State(initialValue: initialPageSize)
        self.onSelect = onSelect
    }

    var body: some View {
        HStack {
            ForEach(pageSizes, id: \.self) { size in
                Button {
                    selectedPageSize = size
                    onSelect(selectedPageSize)
                } label: {
                    Text("\(size)")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            selectedPageSize == size
                                ? .purple : .gray
                        )
                        .clipShape(
                            RoundedRectangle(cornerRadius: 16)
                        )
                        .foregroundStyle(.white)
                }
                .buttonStyle(.plain)
                .accessibilityAddTraits(
                    selectedPageSize == size
                        ? .isSelected : []
                )
            }
        }
    }
}

#Preview {
    @Previewable @State var selectedPageSize: Int = 10
    PageSizeView(initialPageSize: selectedPageSize, onSelect: { pageSize in
        
    })
}
