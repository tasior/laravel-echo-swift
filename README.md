# laravel-echo-swift

Swift client for Laravel event broadcasting.

Swift port of official Laravel JavaScript library [Echo](https://github.com/laravel/echo).


##Example
```swift
// TODO: Write an example
```

##Installation
Requires Swift 3/Xcode 8.x

Manually (iOS 7+)
-----------------
1. Copy the Source folder into your Xcode project. (Make sure you add the files to your target(s))
2. If you plan on using this from Objective-C, read [this](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/BuildingCocoaApps/MixandMatch.html) on exposing Swift code to Objective-C.

Swift Package Manager
---------------------
Add the project as a dependency to your Package.swift:
```swift
import PackageDescription

let package = Package(
    name: "LaravelEchoProject",
    dependencies: [
        .Package(url: "https://github.com/tasior/laravel-echo-swift", majorVersion: 1)
    ]
)
```

Then import `import LaravelEcho`.

CocoaPods 1.0.0 or later
------------------
Create `Podfile` and add `pod 'laravel-echo-swift'`:

```ruby
use_frameworks!

target 'YourApp' do
    pod 'laravel-echo-swift', '~> 1.0.0' # Or latest version
end
```

Install pods:

```
$ pod install
```

Import the module:

Swift:
```swift
import LaravelEcho
```

Objective-C:

```Objective-C
@import LaravelEcho;
```

CocoaSeeds
-----------------

Add this line to your `Seedfile`:

```
github "tasior/laravel-echo-swift", "v1.0.0", :files => "Sources/*.swift" # Or latest version
```

Run `seed install`.
