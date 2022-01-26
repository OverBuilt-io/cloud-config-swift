//  Created by Jonathan Danek on 1/25/22.
//  Copyright © 2021 Danek.me All rights reserved.

import Foundation
import Combine
import Metal

class Updater {

  var configPublisher: CurrentValueSubject<Config?, Never> = CurrentValueSubject(nil)

  let storage: Storage
  var configuration: Configuration?

  var subscription: AnyCancellable?
  var fetchSubscription: AnyCancellable?

  init(storage: Storage) {
    self.storage = storage
  }

  func start(with configuration: Configuration, default config: Config? = nil) throws {

    if let config = config {
      try storage.setDefaults(config: config)
      configPublisher.send(try storage.load())
    }

    self.configuration = configuration
    self.update()

    subscription?.cancel()
    subscription = Timer
      .publish(every: 30.0, on: .current, in: .common, options: nil)
      .autoconnect()
      .sink { _ in
        self.update()
      }
  }

  func update() {
    fetchSubscription?.cancel()
    fetchSubscription = Cloud.fetch(id: configuration?.spaceId ?? "0")
      .sink { _ in

      } receiveValue: { config in
        self.configPublisher.send(config)
        try? self.storage.save(config: config)
      }
  }
}
