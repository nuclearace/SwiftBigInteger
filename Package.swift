import PackageDescription

let package = Package(
    name: "SwiftBigInt",
    dependencies: [
        .Package(url: "https://github.com/nuclearace/LibTomMathSwift", majorVersion: 1)
    ]
)