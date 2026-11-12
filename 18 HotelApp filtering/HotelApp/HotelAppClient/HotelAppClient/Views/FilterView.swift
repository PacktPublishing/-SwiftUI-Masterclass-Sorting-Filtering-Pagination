//
//  FilterView.swift
//  HotelAppClient
//
//  Created by Mohammad Azam on 10/21/26.
//

import SwiftUI

struct FilterView: View {
    
    @State private var selectedFilters: Set<FilterOption>
    let onDone: (Set<FilterOption>) -> Void
    
    @Environment(\.dismiss) private var dismiss
    
    init(initialFilters: Set<FilterOption>, onDone: @escaping (Set<FilterOption>) -> Void) {
        _selectedFilters = State(initialValue: initialFilters)
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
                    selectedFilters = []
                }
                
            }.padding([.bottom], 10)
            
            ForEach(FilterOption.allCases) { option in
                
                Button {
                    // action
                    if selectedFilters.contains(option) {
                        selectedFilters.remove(option)
                    } else {
                        selectedFilters.insert(option)
                    }
                    
                } label: {
                    HStack {
                        Image(systemName: selectedFilters.contains(option) ? "checkmark.square.fill": "square")
                        Text(option.title)
                    }
                }.buttonStyle(.plain)
                
            }
            
            Button("Done") {
                onDone(selectedFilters)
                dismiss()
            }.buttonStyle(.borderedProminent)
        }.padding()
    }
}

#Preview {
    @Previewable @State var initialFilters: Set<FilterOption> = [.breakfast, .parking]
    FilterView(initialFilters: initialFilters) { selectedFilters in
        print(selectedFilters)
    }
}
