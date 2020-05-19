# SimpleTabBarAnimations

[![Swift Version][swift-image]][swift-url]
[![License][license-image]][license-url]
[![CocoaPods Compatible][version-url]][pod-url]
![Platform][platform-url]

Add animations to your tab bar in a simple manner.

## Requirements
- iOS 12.0+
- Swift 5

## Instalation

SimpleTabBarAnimations is available through [CocoaPods](https://cocoapods.org). To install it, simply add the following line to your Podfile:

```ruby
pod 'SimpleTabBarAnimations'
```

## Usage Example

1. Make sure you have set a tint color to your tab bar.

```swift
tabBar.barTintColor = .white
```

2. Import SimpleTabBarAnimation and conform your UITabBarController to it.

```swift
import SimpleTabBarAnimation
```

3. Override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) and
use the provided functionality in it.

```swift
extension TabBarVC: SimpleTabBarAnimation {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        playAnimation(type: .bounce, for: item)
    }
}
```

## License

SimpleTabBarAnimations is available under the MIT license. See the [LICENSE][license-url] file for more info.

[swift-image]:https://img.shields.io/badge/swift-5-green.svg
[swift-url]:  https://swift.org/
[license-url]: https://github.com/aleksgeyman/simple-tab-bar-animations/blob/master/LICENSE
[license-image]:  https://img.shields.io/badge/License-MIT-blue.svg
[version-url]:  https://img.shields.io/cocoapods/v/SimpleTabBarAnimations.svg
[pod-url]: http://cocoapods.org/pods/SimpleTabBarAnimations
[platform-url]: https://img.shields.io/cocoapods/p/SimpleTabBarAnimations
