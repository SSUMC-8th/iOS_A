import ProjectDescription

let project = Project(
    name: "StarBucks",
    targets: [
        .target(
            name: "StarBucks",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.StarBucks",
            infoPlist: .extendingDefault(
                            with: [
                                "UILaunchScreen": [
                                    "UIColorName": "",
                                    "UIImageName": "",
                                ],
                                "UIAppFonts": [
                                    "Pretendard-Black.otf",
                                    "Pretendard-Bold.otf",
                                    "Pretendard-ExtraBold.otf",
                                    "Pretendard-ExtraLight.otf",
                                    "Pretendard-Light.otf",
                                    "Pretendard-Medium.otf",
                                    "Pretendard-Regular.otf",
                                    "Pretendard-SemiBold.otf",
                                    "Pretendard-Thin.otf"
                                ]
                            ]
                        ),
            sources: ["StarBucks/Sources/**"],
            resources: ["StarBucks/Resources/**"],
            dependencies: []
        ),
        .target(
            name: "StarBucksTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.StarBucksTests",
            infoPlist: .default,
            sources: ["StarBucks/Tests/**"],
            resources: [],
            dependencies: [.target(name: "StarBucks")]
        ),
    ]
)
