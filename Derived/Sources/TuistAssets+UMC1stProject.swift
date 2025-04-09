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
public enum UMC1stProjectAsset: Sendable {
  public enum Assets {
  public static let accentColor = UMC1stProjectColors(name: "AccentColor")
    public static let appleLogin = UMC1stProjectImages(name: "AppleLogin")
    public static let caffeAmericano = UMC1stProjectImages(name: "CaffeAmericano")
    public static let caramelMacchiato = UMC1stProjectImages(name: "CaramelMacchiato")
    public static let espressoConPanna = UMC1stProjectImages(name: "EspressoConPanna")
    public static let espressoMacchiato = UMC1stProjectImages(name: "EspressoMacchiato")
    public static let home = UMC1stProjectImages(name: "Home")
    public static let icedCaffeAmericano = UMC1stProjectImages(name: "IcedCaffeAmericano")
    public static let icedCaramelMacchiato = UMC1stProjectImages(name: "IcedCaramelMacchiato")
    public static let kakaoLogin = UMC1stProjectImages(name: "KakaoLogin")
    public static let logout = UMC1stProjectImages(name: "Logout")
    public static let onlineStore1 = UMC1stProjectImages(name: "OnlineStore_1")
    public static let onlineStore2 = UMC1stProjectImages(name: "OnlineStore_2")
    public static let onlineStore3 = UMC1stProjectImages(name: "OnlineStore_3")
    public static let order = UMC1stProjectImages(name: "Order")
    public static let other = UMC1stProjectImages(name: "Other")
    public static let pay = UMC1stProjectImages(name: "Pay")
    public static let selectedHome = UMC1stProjectImages(name: "SelectedHome")
    public static let selectedOrder = UMC1stProjectImages(name: "SelectedOrder")
    public static let selectedOther = UMC1stProjectImages(name: "SelectedOther")
    public static let selectedPay = UMC1stProjectImages(name: "SelectedPay")
    public static let selectedShop = UMC1stProjectImages(name: "SelectedShop")
    public static let shop = UMC1stProjectImages(name: "Shop")
    public static let starbucksLogo = UMC1stProjectImages(name: "StarbucksLogo")
    public static let adbanner = UMC1stProjectImages(name: "adbanner")
    public static let allCoffeeproducts = UMC1stProjectImages(name: "all_coffeeproducts")
    public static let allLifestyle = UMC1stProjectImages(name: "all_lifestyle")
    public static let allMugcup = UMC1stProjectImages(name: "all_mugcup")
    public static let allPresent = UMC1stProjectImages(name: "all_present")
    public static let allThermos = UMC1stProjectImages(name: "all_thermos")
    public static let allTumbler = UMC1stProjectImages(name: "all_tumbler")
    public static let back = UMC1stProjectImages(name: "back")
    public static let bestItems1 = UMC1stProjectImages(name: "bestItems_1")
    public static let beveragebanner = UMC1stProjectImages(name: "beveragebanner")
    public static let bloomingbanner = UMC1stProjectImages(name: "bloomingbanner")
    public static let coldbrewbanner = UMC1stProjectImages(name: "coldbrewbanner")
    public static let deliverysvcbanner = UMC1stProjectImages(name: "deliverysvcbanner")
    public static let icechallengebanner = UMC1stProjectImages(name: "icechallengebanner")
    public static let list = UMC1stProjectImages(name: "list")
    public static let mugcupbanner = UMC1stProjectImages(name: "mugcupbanner")
    public static let new = UMC1stProjectImages(name: "new")
    public static let onlinestorebanner = UMC1stProjectImages(name: "onlinestorebanner")
    public static let servicebanner = UMC1stProjectImages(name: "servicebanner")
    public static let share = UMC1stProjectImages(name: "share")
    public static let smileclubbanner = UMC1stProjectImages(name: "smileclubbanner")
    public static let store1 = UMC1stProjectImages(name: "store_1")
    public static let store2 = UMC1stProjectImages(name: "store_2")
    public static let store3 = UMC1stProjectImages(name: "store_3")
    public static let topbanner = UMC1stProjectImages(name: "topbanner")
    public static let whatsnew1 = UMC1stProjectImages(name: "whatsnew_1")
    public static let whatsnew2 = UMC1stProjectImages(name: "whatsnew_2")
    public static let whatsnew3 = UMC1stProjectImages(name: "whatsnew_3")
    public static let 고객의소리 = UMC1stProjectImages(name: "고객의 소리")
    public static let 나만의메뉴 = UMC1stProjectImages(name: "나만의 메뉴")
    public static let 내용보기버튼 = UMC1stProjectImages(name: "내용 보기 버튼")
    public static let 너티크루아상 = UMC1stProjectImages(name: "너티 크루아상")
    public static let 마이스타벅스리뷰 = UMC1stProjectImages(name: "마이 스타벅스 리뷰")
    public static let 매장정보 = UMC1stProjectImages(name: "매장 정보")
    public static let 매콤소시지불고기 = UMC1stProjectImages(name: "매콤 소시지 불고기")
    public static let 미니리프파이 = UMC1stProjectImages(name: "미니 리프 파이")
    public static let 반납기정보 = UMC1stProjectImages(name: "반납기 정보")
    public static let 별히스토리 = UMC1stProjectImages(name: "별 히스토리")
    public static let 뺑오쇼콜라 = UMC1stProjectImages(name: "뺑 오 쇼콜라")
    public static let 소시지올리브파이 = UMC1stProjectImages(name: "소시지&올리브 파이")
    public static let 스타벅스카드등록 = UMC1stProjectImages(name: "스타벅스 카드 등록")
    public static let 스토어케어 = UMC1stProjectImages(name: "스토어 케어")
    public static let 아이스카라멜마키아또 = UMC1stProjectImages(name: "아이스 카라멜 마키아또")
    public static let 아이스카페아메리카노 = UMC1stProjectImages(name: "아이스 카페 아메리카노")
    public static let 에스프레소마키아또 = UMC1stProjectImages(name: "에스프레소 마키아또")
    public static let 에스프레소콘파나 = UMC1stProjectImages(name: "에스프레소 콘파나")
    public static let 전자영수증 = UMC1stProjectImages(name: "전자영수증")
    public static let 카드교환권등록 = UMC1stProjectImages(name: "카드 교환권 등록")
    public static let 카라멜마키아또 = UMC1stProjectImages(name: "카라멜 마키아또")
    public static let 카페아메리카노 = UMC1stProjectImages(name: "카페 아메리카노")
    public static let 쿠폰등록 = UMC1stProjectImages(name: "쿠폰 등록")
    public static let 쿠폰히스토리 = UMC1stProjectImages(name: "쿠폰 히스토리")
  }
  public enum Colors {
  public static let black01 = UMC1stProjectColors(name: "black01 ")
    public static let black02 = UMC1stProjectColors(name: "black02")
    public static let black03 = UMC1stProjectColors(name: "black03")
    public static let blue01 = UMC1stProjectColors(name: "blue01")
    public static let brown01 = UMC1stProjectColors(name: "brown01")
    public static let brown02 = UMC1stProjectColors(name: "brown02")
    public static let gray00 = UMC1stProjectColors(name: "gray00")
    public static let gray01 = UMC1stProjectColors(name: "gray01")
    public static let gray02 = UMC1stProjectColors(name: "gray02")
    public static let gray03 = UMC1stProjectColors(name: "gray03")
    public static let gray04 = UMC1stProjectColors(name: "gray04")
    public static let gray05 = UMC1stProjectColors(name: "gray05")
    public static let gray06 = UMC1stProjectColors(name: "gray06")
    public static let gray07 = UMC1stProjectColors(name: "gray07")
    public static let green00 = UMC1stProjectColors(name: "green00")
    public static let green01 = UMC1stProjectColors(name: "green01")
    public static let green02 = UMC1stProjectColors(name: "green02")
    public static let green03 = UMC1stProjectColors(name: "green03")
    public static let red01 = UMC1stProjectColors(name: "red01")
    public static let white01 = UMC1stProjectColors(name: "white01")
  }
  public enum PreviewAssets {
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

public final class UMC1stProjectColors: Sendable {
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

public extension UMC1stProjectColors.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, visionOS 1.0, *)
  convenience init?(asset: UMC1stProjectColors) {
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
  init(asset: UMC1stProjectColors) {
    let bundle = Bundle.module
    self.init(asset.name, bundle: bundle)
  }
}
#endif

public struct UMC1stProjectImages: Sendable {
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
  init(asset: UMC1stProjectImages) {
    let bundle = Bundle.module
    self.init(asset.name, bundle: bundle)
  }

  init(asset: UMC1stProjectImages, label: Text) {
    let bundle = Bundle.module
    self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: UMC1stProjectImages) {
    let bundle = Bundle.module
    self.init(decorative: asset.name, bundle: bundle)
  }
}
#endif

// swiftlint:enable all
// swiftformat:enable all
