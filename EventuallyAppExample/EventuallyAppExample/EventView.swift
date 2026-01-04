//
//  Created by Mikalai Zmachynski.
//  Copyright © 2026 Mikalai Zmachynski. All rights reserved.
//

import SwiftUI

struct EventView: View {
    @Environment(\.pixelLength) private var pixel

    let title: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .foregroundStyle(.eventTitle)
                .font(.caption2)
                .lineLimit(1)
                .truncationMode(.tail)
                .frame(height: 16)
                .padding(.horizontal, 4)
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .topLeading
        )
        .background(.eventBackground)
        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 4, height: 4)))
        .overlay(
            RoundedRectangle(cornerSize: CGSize(width: 4, height: 4))
                .stroke(Color.white, lineWidth: pixel * 2)
        )
    }
}
