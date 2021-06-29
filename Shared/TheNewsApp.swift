//
//  TheNewsApp.swift
//  Shared
//
//  Created by Jaswanth Manigundan on 30/6/21.
//

import SwiftUI

@main
struct TheNewsApp: App {
    var body: some Scene {
        WindowGroup {
            PullToRefreshList()
        }
    }
}
