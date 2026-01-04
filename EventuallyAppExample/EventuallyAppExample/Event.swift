//
//  Created by Mikalai Zmachynski.
//  Copyright © 2026 Mikalai Zmachynski. All rights reserved.
//

import Foundation

struct Event: Identifiable, Hashable {
    var id: Event { self }

    let title: String
    let interval: DateInterval

    init(
        title: String,
        startOfDay: Date,
        timeInHours: Double,
        durationInHours: Double
    ) {
        self.title = title
        interval = .init(
            start: startOfDay.addingTimeInterval(timeInHours * 3600),
            duration: durationInHours * 3600
        )
    }
}

extension Event {
    static func mocks(for date: Date) -> [Event] {
        let startOfDay = Calendar.current.startOfDay(for: date)
        return [
            Event(title: "Event 1", startOfDay: startOfDay, timeInHours: 2.0, durationInHours: 4.5),
            Event(title: "Event 2", startOfDay: startOfDay, timeInHours: 2.0, durationInHours: 1),
            Event(title: "Event 3", startOfDay: startOfDay, timeInHours: 2.25, durationInHours: 2),
            Event(title: "Event 4", startOfDay: startOfDay, timeInHours: 2.4, durationInHours: 2),
            Event(title: "Event 5", startOfDay: startOfDay, timeInHours: 3, durationInHours: 5),
            Event(title: "Event 6", startOfDay: startOfDay, timeInHours: 3.35, durationInHours: 3),
            Event(title: "Event 7", startOfDay: startOfDay, timeInHours: 3.35, durationInHours: 3),
            Event(title: "Event 8", startOfDay: startOfDay, timeInHours: 3.8, durationInHours: 3),
            Event(title: "Event 9", startOfDay: startOfDay, timeInHours: 3.8, durationInHours: 9),
            Event(title: "Event 10", startOfDay: startOfDay, timeInHours: 3.8, durationInHours: 1.5),
            Event(title: "Event 11", startOfDay: startOfDay, timeInHours: 4.7, durationInHours: 1.5),
            Event(title: "Event 12", startOfDay: startOfDay, timeInHours: 7, durationInHours: 1.5),
            Event(title: "Event 13", startOfDay: startOfDay, timeInHours: 7.5, durationInHours: 1.5),
            Event(title: "Event 14", startOfDay: startOfDay, timeInHours: 8, durationInHours: 1.5),
            Event(title: "Event 15", startOfDay: startOfDay, timeInHours: 8.5, durationInHours: 1.5),
            Event(title: "Event 16", startOfDay: startOfDay, timeInHours: 9, durationInHours: 1.5),
            Event(title: "Event 17", startOfDay: startOfDay, timeInHours: 9.5, durationInHours: 1.5),
            Event(title: "Event 18", startOfDay: startOfDay, timeInHours: 10, durationInHours: 0.5),
            Event(title: "Event 19", startOfDay: startOfDay, timeInHours: 10, durationInHours: 0.5),
            Event(title: "Event 20", startOfDay: startOfDay, timeInHours: 10, durationInHours: 0.5),
            Event(title: "Event 21", startOfDay: startOfDay, timeInHours: 11.2, durationInHours: 2),
            Event(title: "Event 22", startOfDay: startOfDay, timeInHours: 11.6, durationInHours: 0.5),
            Event(title: "Event 23", startOfDay: startOfDay, timeInHours: 11.6, durationInHours: 0.5),
            Event(title: "Event 24", startOfDay: startOfDay, timeInHours: 11.6, durationInHours: 0.5),
            Event(title: "Event 25", startOfDay: startOfDay, timeInHours: 11.6, durationInHours: 0.5),
            Event(title: "Event 26", startOfDay: startOfDay, timeInHours: 11.6, durationInHours: 0.5),
            Event(title: "Event 27", startOfDay: startOfDay, timeInHours: 11.6, durationInHours: 0.5),
            Event(title: "Event 28", startOfDay: startOfDay, timeInHours: 13.5, durationInHours: 1),
            Event(title: "Event 29", startOfDay: startOfDay, timeInHours: 14.5, durationInHours: 0.5),
            Event(title: "Event 30", startOfDay: startOfDay, timeInHours: 15, durationInHours: 0.25),
        ]
    }
}
