//
//  MissionView.swift
//  Moonshot
//
//  Created by Eliezer Rodrigo Beltramin de Sant Ana on 23/07/24.
//

import SwiftUI

@available(iOS 17.0, *)
struct MissionView: View {
    
    let mission: Mission
    let crew: [CrewMember]
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        
        self.crew = mission.crew.map { member in
            if let astrounaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astrounaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) { width, axis in
                        width * 0.6
                    }
                    .padding(.top)
                
                Text(mission.formattedLaunchDate)
                    .padding(.top)
                    .font(.title3)
                    .bold()
                
                VStack(alignment: .leading) {
                    
                    Rectangle()
                        .frame(height: 2)
                        .foregroundStyle(.lightBackground)
                        .padding(.vertical)
                    
                    Text("Mission Highlights")
                        .font(.title)
                        .bold()
                        .foregroundStyle(.text)
                        .padding(.bottom, 5)
                    
                    Text(mission.description)
                        .foregroundStyle(.text)
                    
                    Rectangle()
                        .frame(height: 2)
                        .foregroundStyle(.lightBackground)
                        .padding(.vertical)
                    
                    Text("Crew")
                        .font(.title)
                        .bold()
                        .foregroundStyle(.text)
                        .padding(.top, 5)
                        .padding(.bottom, 5)
                }
                .padding(.horizontal)
                
                CrewView(crew: crew)
            }
            .padding(.bottom)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackround)
    }
}

#Preview {
    if #available(iOS 17.0, *) {
        let missions: [Mission] = Bundle.main.decode("missions.json")
        let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
        return NavigationStack {
            MissionView(mission: missions[5], astronauts: astronauts)
                .preferredColorScheme(.dark)
        }
    } else {
        return Color.red
    }
}
