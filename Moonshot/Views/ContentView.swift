//
//  ContentView.swift
//  Moonshot
//
//  Created by Eliezer Rodrigo Beltramin de Sant Ana on 22/07/24.
//

import SwiftUI

@available(iOS 17.0, *)
struct ContentView: View {
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")

    @State private var showAsGrid = true
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            Group {
                if showAsGrid {
                    GridLayout(astronauts: astronauts,
                               missions: missions)
                } else {
                    ListLayout(astronauts: astronauts,
                               missions: missions)
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackround)
            .preferredColorScheme(.dark)
            .toolbar {
                Button(action: {
                    showAsGrid.toggle()
                }, label: {
                    Image(systemName: showAsGrid ? "rectangle.grid.1x2" : "rectangle.grid.2x2")
                        .foregroundStyle(.text)
                })
            }
            .navigationDestination(for: Mission.self) { mission in
                MissionView(mission: mission, astronauts: astronauts)
            }
        }
    }
    
    struct ListLayout: View {
        let astronauts: [String: Astronaut]
        let missions: [Mission]
        
        var body: some View {
            List {
                ForEach(missions) { mission in
                    NavigationLink(value: mission) {
                        HStack {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                            
                            VStack(alignment: .leading) {
                                Text(mission.displayName)
                                    .font(.headline)
                                    .foregroundStyle(.text)
                                Text(mission.formattedLaunchDate)
                                    .foregroundStyle(.text.opacity(0.5))
                                    .font(.subheadline)
                            }
                            .padding(.leading, 4)
                        }
                    }
                }
                .listRowBackground(Color.darkBackround)
            }
            .listStyle(.plain)
        }
    }
    
    struct GridLayout: View {
        
        let columns = [
            GridItem(.adaptive(minimum: 150))
        ]
        let astronauts: [String: Astronaut]
        let missions: [Mission]
        
        var body: some View {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(missions) { mission in
                        NavigationLink(value: mission) {
                            VStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .padding()
                                
                                VStack {
                                    Text(mission.displayName)
                                        .font(.headline)
                                        .foregroundStyle(.text)
                                    Text(mission.formattedLaunchDate)
                                        .foregroundStyle(.text.opacity(0.5))
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(.lightBackground)
                            }
                            .clipShape(.rect(cornerRadius: 10))
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.lightBackground)
                            }
                        }
                    }
                }
                .padding([.horizontal, .bottom])
            }
        }
    }
}

#Preview {
    if #available(iOS 17.0, *) {
        return ContentView()
    } else {
        return Color.red
    }
}
