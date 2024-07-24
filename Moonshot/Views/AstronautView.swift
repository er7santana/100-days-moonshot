//
//  AstronautView.swift
//  Moonshot
//
//  Created by Eliezer Rodrigo Beltramin de Sant Ana on 24/07/24.
//

import SwiftUI

struct AstronautView: View {
    
    let astronaut: Astronaut
    
    var body: some View {
        ScrollView{
            VStack {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                
                VStack(alignment: .leading) {
                    Text("Bio")
                        .font(.title)
                        .bold()
                        .foregroundStyle(.text)
                        .padding(.bottom, 5)
                    
                    Text(astronaut.description)
                        .foregroundStyle(.text)
                }
                .padding()
            }
        }
        .background(.darkBackround)
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    return
    NavigationView {
        AstronautView(astronaut: astronauts["armstrong"]!)
            .preferredColorScheme(.dark)
    }
}
