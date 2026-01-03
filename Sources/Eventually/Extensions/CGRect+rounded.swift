//
//  Created by Mikalai Zmachynski.
//  Copyright © 2026 Mikalai Zmachynski. All rights reserved.
//

import Foundation

extension CGRect {
    func rounded(to places: Int) -> CGRect {
        CGRect(
            x: minX.rounded(to: places),
            y: minY.rounded(to: places),
            width: width.rounded(to: places),
            height: height.rounded(to: places)
        )
    }
}
