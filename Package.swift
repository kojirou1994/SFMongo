import PackageDescription

#if os(OSX)
let package = Package(
    name: "SFMongo",
    targets: [],
    dependencies: [  
        .Package(url: "https://github.com/PerfectlySoft/Perfect-mongo-c.git", versions: Version(0,0,0)..<Version(10,0,0)),
        .Package(url: "https://github.com/kojirou1994/SFJSON.git", versions: Version(0,0,0)..<Version(10,0,0))
    ]
)
#else
let package = Package(
    name: "SFMongo",
    targets: [],
    dependencies: [
        .Package(url: "https://github.com/PerfectlySoft/Perfect-mongo-c-linux.git", versions: Version(0,0,0)..<Version(10,0,0)),
        .Package(url: "https://github.com/kojirou1994/SFJSON.git", versions: Version(0,0,0)..<Version(10,0,0))
    ]
)
#endif

