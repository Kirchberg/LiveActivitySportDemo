//
//  StartActivityButtonView.swift
//  live-activity-sport-demo
//
//  Created by Kostarev Kirill on 03.02.2024.
//

import SwiftUI

struct StartActivityButtonView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Матч в прямом эфире!")
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                    .padding(.bottom, 2)

                Text("Следите за матчем в реальном времени и будьте в курсе всех событий!")
                    .font(.system(size: 14))
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            Spacer()

            Button(action: {
                // Handle button action here
            }) {
                Text("Отслеживать")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.orange,Color.red]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .cornerRadius(20)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 2)
        .padding(.horizontal)
    }
}

#Preview {
    StartActivityButtonView()
}
