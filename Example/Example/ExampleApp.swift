//  Created by Jonathan Danek on 1/26/22.
//  Copyright © 2021 Danek.me All rights reserved.

import SwiftUI
import cloud_config_swift

@main
struct ExampleApp: App {

  init() {
    do {
      try CloudConfig.shared.setup(id: "1", version: Bundle.main.infoDictionary?["CFBundleVersion"] as! String, key: "193ffa9148msh52aeb2d9a7a0fb1p10e6a1jsndd8891d8b785", default: nil)
    } catch {
      print(error.localizedDescription)
    }

  }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
