//
//  Created by Mikalai Zmachynski.
//  Copyright © 2026 Mikalai Zmachynski. All rights reserved.
//

import Foundation

extension CGFloat {
    func rounded(to places: Int, rule: FloatingPointRoundingRule = .toNearestOrAwayFromZero) -> CGFloat {
        let divisor = pow(10.0, CGFloat(places))
        return (self * divisor).rounded(rule) / divisor
    }
}
