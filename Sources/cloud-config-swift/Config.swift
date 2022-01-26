//  Created by Jonathan Danek on 1/22/22.
//  Copyright © 2021 Overbuilt.io All rights reserved.

import Foundation
import JSON

public struct Config {
  var content: JSON

  public var rawString: String {
    guard
      let data = try? JSONEncoder().encode(content),
      let string = String(data: data, encoding: .utf8)
    else { return "{}" }
    return string
  }
  public func string(string: String) -> String? {
    content[string].string
  }

  public func bool(bool: String) -> Bool? {
    content[bool].bool
  }

  public func double(double: String) -> Double? {
    content[double].number
  }

  public func json(json: String) -> [JSON.Key: JSON.Value]? {
    content[json].object
  }

  init(data: Data) throws {

    content = try JSONDecoder().decode(JSON.self, from: data)
  }
}
