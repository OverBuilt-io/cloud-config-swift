//  Created by Jonathan Danek on 1/22/22.
//  Copyright © 2021 Overbuilt.io All rights reserved.

import Foundation
import Combine
import JSON

internal class Cloud {


  static func fetch(id: String) -> AnyPublisher<Config, Error> {
    let headers = [
      "x-rapidapi-host": "overbuilt-cloud-config.p.rapidapi.com",
      "x-rapidapi-key": CloudConfig.shared.updater.configuration?.key ?? ""
    ]

    let request = NSMutableURLRequest(url: NSURL(string: "https://overbuilt-cloud-config.p.rapidapi.com/config/1?version=\(CloudConfig.shared.updater.configuration?.version ?? "")")! as URL,
                                            cachePolicy: .useProtocolCachePolicy,
                                        timeoutInterval: 10.0)
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = headers

    let session = URLSession.shared
    
    return session.dataTaskPublisher(for: (request as NSURLRequest) as URLRequest)
      .tryMap { response in
        try Config(data: response.data)
      }
      .eraseToAnyPublisher()
  }
}
