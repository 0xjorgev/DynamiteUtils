//
//  File.swift
//  
//
//  Created by Jorge Mendoza on 20/5/24.
//

import Foundation
import SwiftUI

@available(iOS 13.0, *)
public extension View {
    @ViewBuilder func hiddenHack() -> some View {
        self
            .opacity(0.01)
            .frame(height:0.01)
    }
    
    @available(iOS 15.0, *)
    func focused(_ condition: FocusState<Bool>.Binding, onFocus: @escaping (Bool) -> Void) -> some View {
        focused(condition).onChange(of: condition.wrappedValue) { value in
            onFocus(value == true)
        }
    }
    
    func limitInputLength(value: Binding<String>, length: Int) -> some View {
        self.modifier(TextFieldLimitModifer(value: value, length: length))
    }
}
