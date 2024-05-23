//
//  File.swift
//  
//
//  Created by Jorge Mendoza on 20/5/24.
//

import Foundation
import SwiftUI

@available(iOS 13.0, *)
public  struct TextFieldLimitModifer: ViewModifier {
    @Binding var value: String
    var length: Int

    public func body(content: Content) -> some View {
        content
            .onReceive(value.publisher.collect()) {
                value = String($0.prefix(length))
            }
    }
    
    public init(value: Binding<String>, length: Int) {
        self._value = value
        self.length = length
    }
}
