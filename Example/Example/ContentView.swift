//  Created by Jonathan Danek on 1/26/22.
//  Copyright © 2021 Danek.me All rights reserved.

import SwiftUI
import Combine
import cloud_config_swift

struct ContentView: View {

  @ObservedObject var cloudconfig = CloudConfig.shared

  var subscriptions = [AnyCancellable]()

  init() {


  }

    var body: some View {
      VStack {
        Text("Config")
        Text(cloudconfig.config.value?.rawString ?? "")
              .padding()

      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
