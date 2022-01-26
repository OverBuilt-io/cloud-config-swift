//  Created by Jonathan Danek on 1/25/22.
//  Copyright © 2021 Danek.me All rights reserved.

import Foundation

struct Configuration {
  var spaceId: String?
  var version: String?
  var key: String?

  var isSetup: Bool {
    spaceId != nil && version != nil && key != nil
  }
}
