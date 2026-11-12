//
//  SortView.swift
//  HotelAppClient
//
//  Created by Mohammad Azam on 10/19/26.
//

import SwiftUI

struct SortView: View {
    
    @State private var selectedSortOption: SortOption?
    let onDone: (SortOption) -> Void
    
    @Environment(\.dismiss) private var dismiss
    
    init(initialSelection: SortOption? = nil, onDone: @escaping (SortOption?) -> Void) {
        _selectedSortOption = State(initialValue: initialSelection)
        self.onDone = onDone
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                Button("Close") {
                    dismiss()
                }
                
                Spacer()
                
                Button("Clear") {
                    selectedSortOption = nil
                }
                
            }.padding([.bottom], 10)
            
            ForEach(SortOption.allCases) { option in
                Button {
                    // action
                    selectedSortOption = option
                } label: {
                    HStack {
                        Image(systemName: selectedSortOption == option ? "largecircle.fill.circle":  "circle")
                        Text(option.title)
                    }
                }.buttonStyle(.plain)

            }
            
            Button("Done") {
                
                if let selectedSortOption {
                    onDone(selectedSortOption)
                }
                
                dismiss()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding([.top], 20)
            .buttonStyle(.borderedProminent)
        }.padding()
    }
}

#Preview {
    SortView { _ in
        
    }
}
