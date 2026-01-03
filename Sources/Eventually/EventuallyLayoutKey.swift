//
//  Created by Mikalai Zmachynski.
//  Copyright © 2026 Mikalai Zmachynski. All rights reserved.
//

import SwiftUI

struct EventuallyLayoutKey: LayoutValueKey {
    static let defaultValue: DateInterval? = nil
}

public extension View {
    func eventuallyDateIntervalLayout(_ value: DateInterval) -> some View {
        layoutValue(key: EventuallyLayoutKey.self, value: value)
    }
}
