// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif
#if canImport(SwiftUI)
  import SwiftUI
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
  internal static let costAnalysisBg = ImageAsset(name: "CostAnalysisBg")
  internal static let costAnalysisSubview = ImageAsset(name: "CostAnalysisSubview")
  internal static let costBenefitAnalysisSubview = ImageAsset(name: "CostBenefitAnalysisSubview")
  internal static let costsCalculationResultSubview = ImageAsset(name: "CostsCalculationResultSubview")
  internal static let employerCostsFirstState = ImageAsset(name: "EmployerCostsFirstState")
  internal static let employerCostsSecondState = ImageAsset(name: "EmployerCostsSecondState")
  internal static let notifications = ImageAsset(name: "notifications")
  internal static let profilePlaceholder = ImageAsset(name: "profilePlaceholder")
  internal static let waveArrow = ImageAsset(name: "waveArrow ")
  internal static let waveArrowFinish = ImageAsset(name: "waveArrowFinish")
  internal static let onboard1 = ImageAsset(name: "onboard1")
  internal static let onboard2 = ImageAsset(name: "onboard2")
  internal static let onboard3 = ImageAsset(name: "onboard3")
  internal static let preloaderBg = ImageAsset(name: "PreloaderBg")
  internal static let preloaderLogo = ImageAsset(name: "preloaderLogo")
  internal static let camera = ImageAsset(name: "camera")
  internal static let feedBack = ImageAsset(name: "feedBack")
  internal static let notificationsBtn = ImageAsset(name: "notificationsBtn")
  internal static let saveBattery = ImageAsset(name: "saveBattery")
  internal static let shareUs = ImageAsset(name: "shareUs")
  internal static let achievementsTab = ImageAsset(name: "achievementsTab")
  internal static let docTab = ImageAsset(name: "docTab")
  internal static let homeTab = ImageAsset(name: "homeTab")
  internal static let tabBarBg = ImageAsset(name: "tabBarBg")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Image = UIImage
  #endif

  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, macOS 10.7, *)
  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if os(iOS) || os(tvOS)
  @available(iOS 8.0, tvOS 9.0, *)
  internal func image(compatibleWith traitCollection: UITraitCollection) -> Image {
    let bundle = BundleToken.bundle
    guard let result = Image(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  internal var swiftUIImage: SwiftUI.Image {
    SwiftUI.Image(asset: self)
  }
  #endif
}

internal extension ImageAsset.Image {
  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
internal extension SwiftUI.Image {
  init(asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }

  init(asset: ImageAsset, label: Text) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(decorative: asset.name, bundle: bundle)
  }
}
#endif

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
