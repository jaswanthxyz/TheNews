//
//  SwiftUI+toVC.swift
//  TheNews
//
//  Created by Jaswanth Manigundan on 30/6/21.
//

import Foundation
import SwiftUI

extension SwiftUI.View {
    func toVC() -> UIViewController {
        let vc = UIHostingController(rootView: self)
        vc.view.frame = UIScreen.main.bounds
        return vc
    }
}
