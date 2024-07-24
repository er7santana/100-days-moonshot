//
//  EliezerView.swift
//  Moonshot
//
//  Created by Eliezer Rodrigo Beltramin de Sant Ana on 24/07/24.
//

import SwiftUI

struct EliezerView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Rectangle()
                .foregroundStyle(.red)
                .containerRelativeFrame(.vertical) { height, _ in
                    return height * 0.3
                }
            
            Rectangle()
                .foregroundStyle(.blue)
                .containerRelativeFrame(.horizontal) { width, _ in
                    return width * 0.5
                }
                .overlay {
                    Rectangle()
                        .foregroundStyle(.yellow)
                        .containerRelativeFrame(.horizontal) { width, _ in
                            return width * 0.25
                        }
                }
            
            
            Spacer()
        }
    }
}

#Preview {
    EliezerView()
}
