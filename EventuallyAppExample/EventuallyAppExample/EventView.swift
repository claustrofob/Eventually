//
//  Created by Mikalai Zmachynski.
//  Copyright © 2026 Mikalai Zmachynski. All rights reserved.
//

import SwiftUI

struct EventView: View {
    let title: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .foregroundStyle(.blue)
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
        .background(.blue.opacity(0.2))
        .cornerRadius(4)
    }
}
