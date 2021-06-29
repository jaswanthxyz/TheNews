//
//  CardModifier.swift
//  TheNews (iOS)
//
//  Created by Jaswanth Manigundan on 30/6/21.
//

import Foundation
import SwiftUI

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(0)
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 0)
    }
    
}
