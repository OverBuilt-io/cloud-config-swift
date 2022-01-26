//  Created by Jonathan Danek on 1/26/22.
//  Copyright © 2021 Danek.me All rights reserved.

import Foundation
import Combine

class Storage {

  var documentsDirectory: URL {
    Foundation.FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
  }

  var latestConfigPath: URL {
    URL(fileURLWithPath: "cloud-config.json", relativeTo: documentsDirectory)
  }

  func setDefaults(config: Config?) throws {
    guard let config = config else { return }
    let lastConfig = try? self.load()
    if lastConfig == nil {
      try save(config: config)
    }
  }

  func save(config: Config) throws {
    try config.content.data.write(to: latestConfigPath)
  }

  func load() throws -> Config  {
    guard FileManager().fileExists(atPath: latestConfigPath.path) else {
      throw CloudConfigError.missingConfig
    }

    let configData = try Data(contentsOf: latestConfigPath)

    return try Config(data: configData)
  }
}
