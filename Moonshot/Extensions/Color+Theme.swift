//
//  Color+Theme.swift
//  Moonshot
//
//  Created by Eliezer Rodrigo Beltramin de Sant Ana on 23/07/24.
//

import SwiftUI

extension ShapeStyle where Self == Color {
    static var darkBackround: Color {
        Color(red: 0.1, green: 0.1, blue: 0.15)
    }
    
    static var lightBackground: Color {
        Color(red: 0.2, green: 0.2, blue: 0.28)
    }
    
    static var text: Color {
        Color(red: 0.9, green: 0.9, blue: 0.9)
    }
}
