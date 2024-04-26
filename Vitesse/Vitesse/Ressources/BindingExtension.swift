//
//  BindingExtension.swift
//  Vitesse
//
//  Created by Tristan Géhanne on 26/04/2024.
//


import SwiftUI

extension Binding {
    static func nilCoalescing(_ binding: Binding<Value?>, defaultValue: Value) -> Binding<Value> {
        return Binding<Value>(
            get: { binding.wrappedValue ?? defaultValue },
            set: { binding.wrappedValue = $0 }
        )
    }
}
