//
//  MoonshotApp.swift
//  Moonshot
//
//  Created by Eliezer Rodrigo Beltramin de Sant Ana on 22/07/24.
//

import SwiftUI

@main
struct MoonshotApp: App {
    var body: some Scene {
        WindowGroup {
            if #available(iOS 17.0, *) {
                ContentView()
            } else {
                Color.red
            }
        }
    }
}
