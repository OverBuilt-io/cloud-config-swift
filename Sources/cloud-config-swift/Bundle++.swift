//  Created by Jonathan Danek on 1/26/22.
//  Copyright © 2021 Danek.me All rights reserved.

import Foundation

extension Bundle {

  public var versionString: String? {
    infoDictionary?["CFBundleVersion"] as? String  }
}
