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
