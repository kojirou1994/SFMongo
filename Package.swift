import PackageDescription

let package = Package(
    name: "SFMongo",
    dependencies: [
        .Package(url: "https://github.com/PerfectlySoft/Perfect-mongo-c.git", versions: Version(0,0,0)..<Version(10,0,0))
    ]
)
