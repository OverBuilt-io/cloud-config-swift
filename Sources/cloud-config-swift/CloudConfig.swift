//  Created by Jonathan Danek on 1/22/22.
//  Copyright © 2021 Overbuilt.io All rights reserved.

import Foundation
import Combine

public class CloudConfig: ObservableObject {

  public static var shared = CloudConfig()

  public var config: CurrentValueSubject<Config?, Never> = CurrentValueSubject(nil)

  var updater: Updater
  let storage: Storage

  var subscription: AnyCancellable?

  private init() {
    let storage = Storage()
    self.updater = Updater(storage: storage)
    self.storage = storage

    subscription?.cancel()
    subscription = self.updater.configPublisher.sink { config in
      guard let config = config else { return }
      self.config = CurrentValueSubject<Config?, Never>(config)
      self.objectWillChange.send()
    }
  }

  public func setup(id: String, version: String, key: String, default config: Config? = nil) throws {

    log("Setting up version \(version) of \(id)")
    if let config = config {
      self.config = CurrentValueSubject<Config?, Never>(config)
    }
    try updater.start(with: Configuration(spaceId: id, version: version, key: key), default: config)
    log("Setup complete")
  }

  func log(_ message: String) {
    print("CloudConfig: " + message + "\n")
  }
}
