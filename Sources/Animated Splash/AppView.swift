//
//  SwiftUIView.swift
//  
//
//  Created by Jorge Mendoza on 20/5/24.
//

import SwiftUI

@available(iOS 13.0, *)
public struct AppView<Content:View, Animated:View>: View {
    @State private var hideSplash = false
    @State private var content:()->Content
    @State private var animated:()->Animated
    
    public init(hideSplash: Bool = false, content: @escaping ()->Content, animated: @escaping ()->Animated ) {
        self.hideSplash = hideSplash
        self.content = content
        self.animated = animated
    }
    
    public var body: some View {
        if #available(iOS 15.0, *) {
            startingView
                .task{
                    withAnimation(Animation.spring().delay(2.0)) {
                        hideSplash.toggle()
                    }
                }
            } else {
                // Fallback on earlier versions
            }
    }
    
    @ViewBuilder var startingView: some View {
        if !hideSplash {
            animated()
        } else {
            content()
        }
    }
}

//#Preview {
//    SwiftUIView()
//}
