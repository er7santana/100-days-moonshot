//
//  CrewRole.swift
//  Moonshot
//
//  Created by Eliezer Rodrigo Beltramin de Sant Ana on 23/07/24.
//
import Foundation

struct Mission: Codable, Identifiable, Hashable {
    
    struct CrewRole: Codable, Hashable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }

    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        if #available(iOS 15.0, *) {
            return launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
        } else {
            return "N/A"
        }
    }
}
