import ProjectDescription
import ProjectDescriptionHelpers
import MyPlugin

/*
                +-------------+
                |             |
                |     App     | Contains TuistExample App target and TuistExample unit-test target
                |             |
         +------+-------------+-------+
         |         depends on         |
         |                            |
 +----v-----+                   +-----v-----+
 |          |                   |           |
 |   Kit    |                   |     UI    |   Two independent frameworks to share code and start modularising your app
 |          |                   |           |
 +----------+                   +-----------+

 */

// MARK: - Constant
let projectName = "TuistExample"
let organizationName = "hoo"
let bundleID = "com.\(organizationName).\(projectName)"
let targetVersion = "15.0"

let infoPlist: [String: InfoPlist.Value] = [
	"CFBundleName": "hoo",
	"CFBundleVersionString": "1.0.0",
	"CFBundleVersion": "1",
	"UIApplicationSceneManifest": [
			"UIApplicationSupportsMultipleScenes": false,
			"UISceneConfigurations": [
					"UIWindowSceneSessionRoleApplication": [
							[
									"UISceneConfigurationName": "Default Configuration",
									"UISceneDelegateClassName": "$(PRODUCT_MODULE_NAME).SceneDelegate"
							],
					]
			]
	],
	"UIUserInterfaceStyle": "Light"
]

// MARK: - Project
let project = Project(
	name: projectName,
	organizationName: organizationName,
	packages: [],
	settings: nil,
	targets: [
		Target(
			name: projectName,
			platform: .iOS,
			product: .app,
			bundleId: bundleID,
			deploymentTarget: .iOS(targetVersion: targetVersion, devices: .iphone),
			infoPlist: .extendingDefault(with: infoPlist),
			sources: ["Targets/\(projectName)/Sources/**"],
			resources: ["Targets/\(projectName)/Resources/**"],
			dependencies: []
		)
	],
	schemes: [
		Scheme(name: "\(projectName)-Debug"),
		Scheme(name: "\(projectName)-Release")
	]
)
