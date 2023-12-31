# TuistExample
## 1. Tuist 설치하기
```
curl -Ls https://install.tuist.io | bash
```

## 2. Tuist로 iOS 프로젝트 생성하기
~~~
tuist init --platform ios
~~~

프로젝트가 생성될 폴더에 파일이 있으면 아래와 같은 에러가 나오고 실패
~~~
Can't initialize a project in the non-empty directory at path /Users/project...
~~~
tuist init 할 폴더에는 아무 파일이 없는 상태에서 실행

Plugins, Project.swift, Targets, Tuist 가 생성된다.
<img width="892" alt="스크린샷 2023-07-30 오후 8 56 46" src="https://github.com/ChaNoo97/TuistExample/assets/89408824/1bbfe1a9-4912-408f-9f4c-b57cd94ffa23">

## 3. Tuist edit
Tuist edit 명령어를 이용해 Manifests 프로젝트를 오픈해서 Project.swift 파일을 수정
~~~swift
MAKR: - Constant
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
~~~

~~~swift 
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
~~~
자세한 다른 옵션은 하단 링크에서 확인
[project tuist Docs](https://docs.tuist.io/1/manifests/project/)

## 4. tuist generate
tuist generate 명령어를 이용, 프로젝트 생성
