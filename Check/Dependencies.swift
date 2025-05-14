import ProjectDescription

let dependencies = Dependencies(
    swiftPackageManager: [
        .package(url: "https://github.com/kakao/kakao-ios-sdk", from: "2.17.0")
    ],
    platforms: [.iOS]
)
