# Eventually

A SwiftUI layout engine for displaying overlapping calendar events with intelligent automatic positioning — just like iOS Calendar and Google Calendar.

[![Swift](https://img.shields.io/badge/Swift-6.2-orange.svg)](https://swift.org)
[![Platforms](https://img.shields.io/badge/Platforms-iOS%2016%2B-blue.svg)](https://developer.apple.com)
[![SPM](https://img.shields.io/badge/SPM-compatible-brightgreen.svg)](https://swift.org/package-manager)
[![License](https://img.shields.io/badge/License-MIT-lightgrey.svg)](LICENSE)

## Overview

Eventually is a powerful SwiftUI custom layout that automatically arranges overlapping calendar events in a clean, space-efficient timeline view. It intelligently positions events side-by-side when they overlap, ensuring titles remain visible and events occupy the widest possible area — exactly how modern calendar apps handle event visualization.

<img width="201" height="437" alt="eventually_portrait" src="https://github.com/user-attachments/assets/48163800-75b4-4f03-88e0-ace4b1aa450a" />
<img width="437" height="201" alt="eventually_landscape" src="https://github.com/user-attachments/assets/360c1544-ef7a-41ce-bd09-643edecc1064" />


### Features

- 🎯 **Smart Positioning**: Automatically arranges overlapping events to maximize visibility
- 📱 **Calendar-Style Layout**: Mimics iOS and Google Calendar event positioning
- ⚡️ **SwiftUI Native**: Built on SwiftUI's Layout protocol for optimal performance
- 🎨 **Customizable**: Configure spacing, padding, and minimum dimensions
- 📏 **Flexible Timeline**: Works with any hour slot height and time range
- 🔄 **Efficient Caching**: Optimized layout calculations with intelligent caching

## Installation

### Swift Package Manager

Add Eventually to your project using Xcode:

1. File → Add Package Dependencies
2. Enter the package URL: `https://github.com/claustrofob/Eventually.git`
3. Select the version you want to use

Or add it to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/claustrofob/Eventually.git", from: "1.0.0")
]
```

## Quick Start

```swift
import Eventually
import SwiftUI

struct CalendarView: View {
    let events: [Event]
    let startOfDay: Date
    
    var body: some View {
        EventuallyLayout(
            startOfDay: startOfDay,
            hourSlotHeight: 60
        ) {
            ForEach(events) { event in
                EventCard(event: event)
                    .eventuallyDateIntervalLayout(event.interval)
            }
        }
    }
}
```

## Usage

### Basic Setup

The `EventuallyLayout` requires two essential parameters:

- `startOfDay`: The beginning of the day (00:00:00) in your local timezone
- `hourSlotHeight`: The height in points for one hour on your timeline

```swift
let startOfDay = Calendar.current.startOfDay(for: Date())
let hourSlotHeight: CGFloat = 60

EventuallyLayout(
    startOfDay: startOfDay,
    hourSlotHeight: hourSlotHeight
) {
    // Your event views here
}
```

### Adding Events

Each event view must be tagged with a `DateInterval` using the `.eventuallyDateIntervalLayout()` modifier:

```swift
EventCard(title: "Team Meeting")
    .eventuallyDateIntervalLayout(DateInterval(
        start: meetingStart,
        duration: 3600 // 1 hour in seconds
    ))
```

### Configuration

Customize the layout behavior with `EventuallyConfiguration`:

```swift
let config = EventuallyConfiguration(
    hSpacing: 1,          // Horizontal spacing between events (default: 1)
    hPadding: 14,         // Left padding for nested events (default: 14)
    titleHeight: 20,      // Height reserved for event titles (default: 20)
    minEventWidth: 4,     // Minimum event view width (default: 4)
    minEventHeight: 16    // Minimum event view height (default: 16)
)

EventuallyLayout(
    startOfDay: startOfDay,
    hourSlotHeight: 60,
    config: config
) {
    // Your event views
}
```

## How It Works

Eventually uses a sophisticated algorithm to arrange overlapping events:

1. **Sorting**: Events are sorted by start time and duration
2. **Sequential Processing**: Events are aligned from oldest to newest
3. **Collision Detection**: Identifies groups of overlapping events (HStacks)
4. **Frame Calculation**: Determines available space considering previously positioned events
5. **Optimal Placement**: Places each event in the widest available space
6. **Title Protection**: Ensures event titles remain visible and don't overlap

### Layout Rules

- Vertical position is determined by the event's start and end time
- Horizontal position is flexible and optimized for space
- Events try to occupy the widest possible area
- Overlapping events are placed side-by-side without intersection
- Event frames never cross the left edge of other events

## Requirements

- iOS 16.0+
- Swift 6.2+
- Xcode 16.0+

## Performance

Eventually is optimized for performance with:

- **Intelligent caching**: Layout calculations are cached and reused when possible
- **Efficient algorithms**: O(n²) worst case, but typically much faster with smart early exits
- **Minimal recalculation**: Only recalculates when layout width changes

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

Eventually is available under the MIT license. See the [LICENSE file](LICENSE) for more info.

## Author

Created by Mikalai Zmachynski

---

**Note**: This layout is particularly useful for calendar apps, scheduling interfaces, and any application that needs to display time-based events in a timeline format.
