# cloud-config-swift

A basic but powerful swift package for enabling cloud configs in your app.
Setup takes 30 seconds!

Integration:

### 1. SPM

```Swift
  .package(url: "https://github.com/OverBuilt-io/cloud-config-swift.git", from: "1.0.0")
```

### 2. Setup RapidAPI

Navigate to [RapidAPI](https://rapidapi.com/jdanek/api/overbuilt-cloud-config/) and subscribe to my API, grab your access key and use it below! Takes 30 seconds and has free credit usage!

### 3. App Startup / Package Configuration
```Swift
  do {
    try CloudConfig.shared.setup(id: "1", version: Bundle.main.infoDictionary?["CFBundleVersion"] as! String, key: "", default: nil)
  } catch {
    print(error.localizedDescription)
  }
```

### 4. Use it in views

```Swift
struct MyView: View {

  @ObservedObject var cloudconfig = CloudConfig.shared

  var body: some View {
    VStack {
      Text("Config")
      Text(cloudconfig.config.value?.rawString ?? "")
    }
  }
}
```
