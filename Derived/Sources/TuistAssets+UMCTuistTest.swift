// swiftlint:disable:this file_name
// swiftlint:disable all
// swift-format-ignore-file
// swiftformat:disable all
// Generated using tuist — https://github.com/tuist/tuist

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

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
public enum UMCTuistTestAsset: Sendable {
  public enum Assets {
  public static let accentColor = UMCTuistTestColors(name: "AccentColor")
    public static let home = UMCTuistTestImages(name: "Home")
    public static let homeGreen = UMCTuistTestImages(name: "HomeGreen")
    public static let order = UMCTuistTestImages(name: "Order")
    public static let orderGreen = UMCTuistTestImages(name: "OrderGreen")
    public static let other = UMCTuistTestImages(name: "Other")
    public static let otherGreen = UMCTuistTestImages(name: "OtherGreen")
    public static let pay = UMCTuistTestImages(name: "Pay")
    public static let payGreen = UMCTuistTestImages(name: "PayGreen")
    public static let shop = UMCTuistTestImages(name: "Shop")
    public static let shopGreen = UMCTuistTestImages(name: "ShopGreen")
    public static let ad = UMCTuistTestImages(name: "ad")
    public static let appleLogin = UMCTuistTestImages(name: "appleLogin")
    public static let back = UMCTuistTestImages(name: "back")
    public static let banner1 = UMCTuistTestImages(name: "banner1")
    public static let banner2 = UMCTuistTestImages(name: "banner2")
    public static let banner3 = UMCTuistTestImages(name: "banner3")
    public static let bearAd = UMCTuistTestImages(name: "bearAd")
    public static let blackback = UMCTuistTestImages(name: "blackback")
    public static let copy1 = UMCTuistTestImages(name: "copy1")
    public static let copy2 = UMCTuistTestImages(name: "copy2")
    public static let copy3 = UMCTuistTestImages(name: "copy3")
    public static let deliveryBanner = UMCTuistTestImages(name: "deliveryBanner")
    public static let eventBanner = UMCTuistTestImages(name: "eventBanner")
    public static let kakaoLogin = UMCTuistTestImages(name: "kakaoLogin")
    public static let logout = UMCTuistTestImages(name: "logout")
    public static let mugcupBanner = UMCTuistTestImages(name: "mugcupBanner")
    public static let new = UMCTuistTestImages(name: "new")
    public static let onlinestoreBanner = UMCTuistTestImages(name: "onlinestoreBanner")
    public static let serviceSuscibe = UMCTuistTestImages(name: "serviceSuscibe")
    public static let shar = UMCTuistTestImages(name: "shar")
    public static let starbucsLogo = UMCTuistTestImages(name: "starbucsLogo")
    public static let topimg = UMCTuistTestImages(name: "topimg")
    public static let 고객의소리 = UMCTuistTestImages(name: "고객의 소리")
    public static let 나만의메뉴 = UMCTuistTestImages(name: "나만의 메뉴")
    public static let 마이스타벅스리뷰 = UMCTuistTestImages(name: "마이 스타벅스 리뷰")
    public static let 매장정보 = UMCTuistTestImages(name: "매장 정보")
    public static let 미니리프파이 = UMCTuistTestImages(name: "미니 리프 파이")
    public static let 반납기정보 = UMCTuistTestImages(name: "반납기 정보")
    public static let 별히스토리 = UMCTuistTestImages(name: "별 히스토리")
    public static let 빵오쇼콜라 = UMCTuistTestImages(name: "빵 오 쇼콜라")
    public static let 소시지불고기 = UMCTuistTestImages(name: "소시지 불고기")
    public static let 소시지 = UMCTuistTestImages(name: "소시지")
    public static let 스타벅스카드등록 = UMCTuistTestImages(name: "스타벅스 카드 등록")
    public static let 스토어케어 = UMCTuistTestImages(name: "스토어 케어")
    public static let 아이스카라멜마끼아또 = UMCTuistTestImages(name: "아이스 카라멜 마끼아또")
    public static let 아이스카라멜마끼아또1 = UMCTuistTestImages(name: "아이스 카라멜 마끼아또1")
    public static let 아이스카페아메리카노 = UMCTuistTestImages(name: "아이스 카페 아메리카노")
    public static let 아이스카페아메리카노1 = UMCTuistTestImages(name: "아이스 카페 아메리카노1")
    public static let 에스프레소마끼아또 = UMCTuistTestImages(name: "에스프레소 마끼아또")
    public static let 에스프레소마끼아또1 = UMCTuistTestImages(name: "에스프레소 마끼아또1")
    public static let 에스프레소콘파나 = UMCTuistTestImages(name: "에스프레소 콘 파나")
    public static let 에스프레소콘파나1 = UMCTuistTestImages(name: "에스프레소 콘 파나1")
    public static let 전자영수증 = UMCTuistTestImages(name: "전자영수증")
    public static let 카드교환권등록 = UMCTuistTestImages(name: "카드 교환권 등록")
    public static let 카라멜마끼아또 = UMCTuistTestImages(name: "카라멜 마끼아또")
    public static let 카라멜마끼아또1 = UMCTuistTestImages(name: "카라멜 마끼아또1")
    public static let 카페아메리카노 = UMCTuistTestImages(name: "카페 아메리카노")
    public static let 카페아메리카노1 = UMCTuistTestImages(name: "카페 아메리카노1")
    public static let 쿠폰등록 = UMCTuistTestImages(name: "쿠폰 등록")
    public static let 쿠폰히스토리 = UMCTuistTestImages(name: "쿠폰 히스토리")
    public static let 크루아상 = UMCTuistTestImages(name: "크루아상")
  }
  public enum Color {
  public static let black01 = UMCTuistTestColors(name: "black01")
    public static let black02 = UMCTuistTestColors(name: "black02")
    public static let black03 = UMCTuistTestColors(name: "black03")
    public static let brown01 = UMCTuistTestColors(name: "brown01")
    public static let brown02 = UMCTuistTestColors(name: "brown02")
    public static let gray00 = UMCTuistTestColors(name: "gray00")
    public static let gray01 = UMCTuistTestColors(name: "gray01")
    public static let gray02 = UMCTuistTestColors(name: "gray02")
    public static let gray03 = UMCTuistTestColors(name: "gray03")
    public static let gray04 = UMCTuistTestColors(name: "gray04")
    public static let gray05 = UMCTuistTestColors(name: "gray05")
    public static let gray06 = UMCTuistTestColors(name: "gray06")
    public static let green00 = UMCTuistTestColors(name: "green00")
    public static let green01 = UMCTuistTestColors(name: "green01")
    public static let green02 = UMCTuistTestColors(name: "green02")
    public static let green03 = UMCTuistTestColors(name: "green03")
    public static let white01 = UMCTuistTestColors(name: "white01")
  }
  public enum PreviewAssets {
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

public final class UMCTuistTestColors: Sendable {
  public let name: String

  #if os(macOS)
  public typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS) || os(visionOS)
  public typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, visionOS 1.0, *)
  public var color: Color {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, visionOS 1.0, *)
  public var swiftUIColor: SwiftUI.Color {
      return SwiftUI.Color(asset: self)
  }
  #endif

  fileprivate init(name: String) {
    self.name = name
  }
}

public extension UMCTuistTestColors.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, visionOS 1.0, *)
  convenience init?(asset: UMCTuistTestColors) {
    let bundle = Bundle.module
    #if os(iOS) || os(tvOS) || os(visionOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, visionOS 1.0, *)
public extension SwiftUI.Color {
  init(asset: UMCTuistTestColors) {
    let bundle = Bundle.module
    self.init(asset.name, bundle: bundle)
  }
}
#endif

public struct UMCTuistTestImages: Sendable {
  public let name: String

  #if os(macOS)
  public typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS) || os(visionOS)
  public typealias Image = UIImage
  #endif

  public var image: Image {
    let bundle = Bundle.module
    #if os(iOS) || os(tvOS) || os(visionOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let image = bundle.image(forResource: NSImage.Name(name))
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, visionOS 1.0, *)
  public var swiftUIImage: SwiftUI.Image {
    SwiftUI.Image(asset: self)
  }
  #endif
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, visionOS 1.0, *)
public extension SwiftUI.Image {
  init(asset: UMCTuistTestImages) {
    let bundle = Bundle.module
    self.init(asset.name, bundle: bundle)
  }

  init(asset: UMCTuistTestImages, label: Text) {
    let bundle = Bundle.module
    self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: UMCTuistTestImages) {
    let bundle = Bundle.module
    self.init(decorative: asset.name, bundle: bundle)
  }
}
#endif

// swiftlint:enable all
// swiftformat:enable all
