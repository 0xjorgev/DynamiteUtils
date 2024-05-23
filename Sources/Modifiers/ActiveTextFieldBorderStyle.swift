//
//  File.swift
//  
//
//  Created by Jorge Mendoza on 20/5/24.
//

import Foundation
import SwiftUI

@available(iOS 13.0, *)
public struct ActiveTextFieldBorderStyle: TextFieldStyle {
    var active:Bool
    let colors:[Color]
    public func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
        .padding(10)
        .background(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .stroke((active ? colors.first : colors.last) ?? .clear, lineWidth:active ? 3 : 1)
        )
    }
    
    public init(active: Bool, colors: [Color]) {
        self.active = active
        self.colors = colors
    }
}
