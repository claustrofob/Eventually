//
//  Created by Mikalai Zmachynski.
//  Copyright © 2026 Mikalai Zmachynski. All rights reserved.
//

import Eventually
import SwiftUI

struct ContentView: View {
    private let hourSlotHeight: CGFloat = 60
    private let timeFormatStyle = Date.FormatStyle()
        .hour(.twoDigits(amPM: .omitted))
        .minute(.twoDigits)
        .locale(Locale(identifier: "en_GB"))
    private let startOfDay = Calendar.current.startOfDay(for: Date())

    var body: some View {
        ScrollView(.vertical) {
            ZStack {
                hoursGridView()
                eventsLayoutView()
                    .padding(EdgeInsets(top: 0, leading: 44, bottom: 0, trailing: 0))
            }
        }
    }

    private func hoursGridView() -> some View {
        VStack(spacing: 0) {
            ForEach(0 ..< 24, id: \.self) { index in
                timeSlotView(index: index)
                    .padding(.bottom, hourSlotHeight)
            }
            timeSlotView(index: 0)
        }
    }

    @ViewBuilder
    private func timeSlotView(index: Int) -> some View {
        HStack(spacing: 6) {
            let x = TimeInterval(3600 * Double(index))
            let date = startOfDay.addingTimeInterval(x)
            Text(date.formatted(timeFormatStyle))
                .font(.caption)
                .fixedSize()
                .frame(width: 32, alignment: .trailing)
            Color.gray
                .frame(maxWidth: .infinity)
                .frame(height: 1 / UIScreen.main.scale)
        }
        .padding(EdgeInsets(top: 16, leading: 12, bottom: 16, trailing: 0))
        .frame(height: 0)
    }

    @ViewBuilder
    private func eventsLayoutView() -> some View {
        EventuallyLayout(startOfDay: startOfDay, hourSlotHeight: hourSlotHeight) {}
    }
}

#Preview {
    ContentView()
}
