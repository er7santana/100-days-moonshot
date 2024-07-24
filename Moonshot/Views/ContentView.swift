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
    
    var body: some View {
        NavigationView  {
            Group {
                if showAsGrid {
                    GridLayout(astronauts: astronauts,
                               missions: missions)
                } else {
                    // Option 2 - Mudar totalmente a forma de apresentar
                    ListLayout(astronauts: astronauts,
                               missions: missions)
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackround)
            .preferredColorScheme(.dark)
            .toolbar {
                Button(showAsGrid ? "List" : "Grid") {
                    showAsGrid.toggle()
                }
            }
        }
    }
    
    struct ListLayout: View {
        let astronauts: [String: Astronaut]
        let missions: [Mission]
        
        var body: some View {
            List {
                ForEach(missions) { mission in
                    NavigationLink {
                        MissionView(mission: mission, astronauts: astronauts)
                    } label: {
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
                        NavigationLink {
                            MissionView(mission: mission, astronauts: astronauts)
                        } label: {
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
