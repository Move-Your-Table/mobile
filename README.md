# myt_mobile

Mobile Agenda application for move your table

## Development Guildeline - Installing Flutter
### Getting the Flutter SDK
[Download Flutter for Windows](https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_2.5.3-stable.zip)
Extract this SDK into your "documents folder".

### Enabling Flutter in CLI
Add your the Flutter bin folder to your Path:
- search for "env" in the windows search bar, to edit your environment variables.
- find the PATH or Path variable and add a link to where you put your SDK so: ".../flutter/bin".

### Finishing setup for windows
- Run flutter doctor in CLI, which will show you what to do to finish up.
- To accept licences: run flutter doctor --android-licences
- To install cli-tools: run the following: 
- - Open Android Studio -> under file -> project -> SDKManager look at its location
- - Open CLI ->  "path/to/sdk/tools/sdkmanager" --install cli-tools

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Building and releasing for iOS
### Developing for iOS
Xcode is required to build and release your app. You must use a device running macOS to follow this guide. It also has to meet [Apple's App Review Guidelines](https://developer.apple.com/app-store/review/).

### Common mistakes in regards to Apple's App Review
**Broken Links.** All links must be functional and must feature up-to-date contact info and a clear privacy policy.

**No placeholder content.** All images and text must be finalized and may not be placeholders.

**Clear permission requests.** When requesting access to user or usage data, you should clearly and completely describe how your app will use the data.

**And more...** can be found on the aforementioned link.

### Register a Bundle ID
To deploy an IOS app to the app store, you need to register it bit a unique identifier registered with Apple. To register a Bundle ID for your app.

### Create an application record on App Store Connect
Create an account on AppStore connect and follow New App flow on the [Website](https://appstoreconnect.apple.com/).

### Review Xcode project settings
This step covers reviewing the most important settings in the Xcode workspace. 

- In Xcode open `Runner.xcworkspace` in your app's `ios` folder.
- `Bundle Identifier` has to be set.
- `Automatically manage signing` will be defaulted to true, lest you want to sign it yourself, you can put it to `true`
- `iOS Deployment Target` is the minimal version for building the app.

### Release your app on TestFlight.
You can release your app on testFlight to send your app to external testers.
For more information [Distribute an app using Testflight](https://help.apple.com/xcode/mac/current/#/dev2539d985f)

### Release your app to the app store.
Check out the pricing and availability on App Store Connect. If it is ready for review, set the status to **1.0**. after which, click submit.

## Building and releasing for Android
### Add a launcher icon
You can do this using the [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons).

### Signing the app.
To publish on the Play Store, you need to give your app a digital signature. Use the following instructions to sign your app. On Android, there are two signing keys: deployment and upload. The end-users download the .apk signed with the ‘deployment key’. An ‘upload key’ is used to authenticate the .aab / .apk uploaded by developers onto the Play Store and is re-signed with the deployment key once in the Play Store.

#### Create an upload keystore
Run the following command in the CLI: 
`keytool -genkey -v -keystore c:\Users\USER_NAME\upload-keystore.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias upload`

#### Reference the keystore from the app
Create a file named `[project]/android/key.properties` that contains a reference to your keystore:
```
storePassword=<password from previous step>
keyPassword=<password from previous step>
keyAlias=upload
storeFile=<location of the key store file, such as /Users/<user name>/upload-keystore.jks>
```

#### Double check app manifest
The following attributes: `application` and `uses-permission` are most important here.

#### Double check the build configuration
Review the default Gradle build file, build.gradle, located in `[project]/android/app` and verify the values are correct, especially the following values in the defaultConfig block:
- applicationId
- versionCode & versionName
- minSdkVersion, compilesdkVersion & targetSdkVersion
- buildToolsVersion

#### Building the app for release
This section describes to build a release app bundle. If you completed the signing steps, the app bundle will be signed. At this point, you might consider obfuscating your Dart code to make it more difficult to reverse engineer. Obfuscating your code involves adding a couple flags to your build command, and maintaining additional files to de-obfuscate stack traces.

From the command line:
1. enter your project
2. Run flutter build appbundle

**you can use:**
*Online, google play*
1. Upload your bundle to Google Play to test it. You can use the internal test track, or the alpha or beta channels to test the bundle before releasing it in production.
2. Follow [these steps to upload your bundle](https://developer.android.com/studio/publish/upload-bundle)