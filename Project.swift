import ProjectDescription

let project = Project(
    name: "UMC_1st_Project",
    targets: [
        .target(
            name: "UMC_1st_Project",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.UMC-1st-Project",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: ["UMC_1st_Project/Sources/**"],
            resources: ["UMC_1st_Project/Resources/**"],
            dependencies: []
        ),
        .target(
            name: "UMC_1st_ProjectTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.UMC-1st-ProjectTests",
            infoPlist: .default,
            sources: ["UMC_1st_Project/Tests/**"],
            resources: [],
            dependencies: [.target(name: "UMC_1st_Project")]
        ),
    ]
)
