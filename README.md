insta clone mini
  A new Flutter project.


State Management
 This project uses GetX for state management. GetX provides a simple and powerful way to manage app state, navigation, and dependency injection. with MVC architecture.

Project Setup
    Follow these steps to run the project on your local machine.
    Make sure you have these installed:
        Flutter SDK
        VS Code
        Git
        Firebase account

Firebase Configuration
  You need to set up Firebase for this project:
    Go to Firebase Console at https://console.firebase.google.com
    Create a new project called "mini-feed"
    Add an Android app to your project
    Use this package name: com.example.mini_feed
    Download the google-services.json file
    Place the google-services.json file in the android/app/ folder

Enable Firestore Database
 In Firebase Console, go to Firestore Database
 Click "Create database"
 Choose "Start in test mode"
 Click "Enable"

Update the Firestore rules to allow read and write:
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /posts/{postId} {
      allow read: if true;
      allow create: if true;
      allow update: if true;
    }
  }
}
Update Android Configuration

 Open android/build.gradle and make sure you have this:


buildscript {
    dependencies {
        classpath 'com.google.gms:google-services:4.3.15'
    }
}


Open android/app/build.gradle and add this at the bottom


apply plugin: 'com.google.gms.google-services'


Also make sure minSdkVersion is at least 21:


defaultConfig {
    minSdkVersion 21
}


Add Permissions
Open AndroidManifest.xml and add these permissions:
    <uses-permission android:name="android.permission.INTERNET"/>
    <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
    <uses-permission android:name="android.permission.CAMERA"/>

Run the App

Connect your Android device or start an emulator, then run:
flutter clean
flutter pub get
flutter run
The app should build and launch on your device.

How to Use
Once the app is running:
 The feed screen will open showing all posts
 Tap the plus button to create a new post
 enter your name and a caption
 Tap Create Post to publish
 Tap any pos to view details
 In the detail view, tap the heart icon to like or unlike the post


Technologies Used
 Flutter - UI framework
 Firebase Firestore - Database for storing posts
 GetX - State management, routing, and dependency injection
 Image Picker - Selecting images from gallery

Troubleshooting
    If you run into issues:
    Problem1: App crashes on startup
    Solution: Make sure google-services.json is in the correct location (android/app/)

    Problem2: Cannot select images
    Solution: Check that permissions are added in AndroidManifest.xml

    Problem3: Posts not appearing
    Solution: Verify Firestore rules allow read access

    Problem4: Images not uploading
    Solution: Check Firebase Storage rules allow write access

    Problem5: Heart icon stays grey after clicking
    Solution: Make sure the post document in Firestore has a likedBy field as an empty array

    Problem6: Like count not updating in real time
    Solution: Verify the Obx widget is wrapping the like count text in postdetailsview

    Problem7: App crashes when opening post details
    Solution: Check that Get.arguments is passed correctly from the feed screen navigation

Note
    This is a demo application created for assessment purposes. The app uses a demo user ID for like functionality. In a production app, you would implement proper user authentication. and also i did not completed the firebase storage because it is asking paid services

