//
//  CrewView.swift
//  Moonshot
//
//  Created by Eliezer Rodrigo Beltramin de Sant Ana on 24/07/24.
//

import SwiftUI

struct CrewView: View {
    
    let crew: [CrewMember]
    
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(crew, id: \.role) { crewMember in
                        NavigationLink(value: crewMember.astronaut) {
                            VStack {
                                Image(crewMember.astronaut.id)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 104, height: 104)
                                    .clipShape(.circle)
                                    .overlay(
                                        Circle()
                                            .strokeBorder(.text, lineWidth: 1)
                                    )
                                
                                VStack(alignment: .leading) {
                                    Text(crewMember.astronaut.name)
                                        .foregroundStyle(.text)
                                        .font(.headline)
                                    HStack {
                                        Text(crewMember.role)
                                            .foregroundStyle(.text.opacity(0.5))
                                        if crewMember.role == "Commander" {
                                            Image(systemName: "star.circle.fill")
                                                .foregroundStyle(.yellow)
                                        }
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                }
            }
            .navigationDestination(for: Astronaut.self) { astronaut in
                AstronautView(astronaut: astronaut)
            }
        }
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let mission = missions[1]
    
    let crew = mission.crew.map { member in
        if let astrounaut = astronauts[member.name] {
            return CrewMember(role: member.role, astronaut: astrounaut)
        } else {
            fatalError("Missing \(member.name)")
        }
    }
    return NavigationView {
        CrewView(crew: crew)
            .preferredColorScheme(.dark)
    }
}
