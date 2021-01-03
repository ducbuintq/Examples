// swift-tools-version:5.2

import PackageDescription

let package = Package(
  
  name: "MacroExamples",

  platforms: [
    .macOS(.v10_14), .iOS(.v11)
  ],
  
  products: [
    .executable(name: "httpd-helloworld",      targets: [ "httpd-helloworld" ]),
    .executable(name: "connect-static",        targets: [ "connect-static"   ]),
    .executable(name: "express-simple",        targets: [ "express-simple"   ]),
    .executable(name    :   "express-simple-lambda", 
                targets : [ "express-simple-lambda" ])
  ],
  
  dependencies: [
    // A lot of packages for demonstration purposes, only add what you
    // actually need in your own project.
    .package(url: "https://github.com/Macro-swift/Macro.git",
             from: "0.5.5"),
    .package(url: "https://github.com/Macro-swift/MacroExpress.git",
             from: "0.5.5"),
    .package(url: "https://github.com/Macro-swift/MacroLambda.git",
             from: "0.1.3"),
    .package(url: "https://github.com/AlwaysRightInstitute/cows",
             from: "1.0.0")
  ],
  
  targets: [
    .target(name: "httpd-helloworld", dependencies: [ "Macro"        ]),
    .target(name: "connect-static",   dependencies: [ "MacroExpress" ]),
    .target(name: "express-simple",   dependencies: [ "MacroExpress", "cows" ]),
    
    .target(name: "express-simple-lambda",
            dependencies: [ "MacroLambda", "cows" ])
  ]
)
