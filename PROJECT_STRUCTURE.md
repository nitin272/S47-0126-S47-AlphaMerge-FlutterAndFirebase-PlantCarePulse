# Flutter Project Structure Documentation

This document was created as part of Sprint-2 to explore and understand the default Flutter project structure and how it supports scalable cross-platform development.

---

## Introduction

Flutter follows a well-organized project structure that separates platform-specific code, application logic, assets, and configuration files. This structure enables developers to build cross-platform applications while maintaining clean, scalable, and maintainable code. Understanding each folder's purpose is crucial for effective Flutter development and team collaboration.

---

## Project Structure Overview

```
PlantCarePulse/
├── android/                    # Android-specific files and configurations
├── ios/                        # iOS-specific files and configurations
├── lib/                        # Main Dart application code
├── linux/                      # Linux desktop-specific files
├── macos/                      # macOS desktop-specific files
├── web/                        # Web-specific files and configurations
├── windows/                    # Windows desktop-specific files
├── test/                       # Test files for unit and widget testing
├── assets/                     # Static resources (images, fonts, etc.)
├── pubspec.yaml               # Project configuration and dependencies
├── pubspec.lock               # Locked dependency versions
├── README.md                  # Project documentation
├── .gitignore                 # Git ignore rules
├── .metadata                  # Flutter project metadata
└── analysis_options.yaml     # Dart analyzer configuration
```

---

## Detailed Folder Analysis

### 1. `lib/` - Application Logic Hub

**Purpose**: Contains all Dart source code for your Flutter application.

**Key Features**:

* `main.dart` - Application entry point where `runApp()` is called
* Organized into subdirectories for better code structure:

  * `screens/` - UI screens and pages
  * `widgets/` - Reusable UI components
  * `services/` - Business logic and API calls
  * `models/` - Data models and classes
  * `utils/` - Helper functions and utilities

**Example Structure**:

```
lib/
├── main.dart
├── screens/
│   └── responsive_home.dart
├── widgets/
├── services/
└── models/
```

---

### 2. `android/` - Android Platform Integration

**Purpose**: Contains Android-specific configurations, build scripts, and native code.

**Key Files**:

* `android/app/build.gradle.kts` - App-level build configuration
* `android/app/src/main/AndroidManifest.xml` - App permissions and metadata
* `android/app/src/main/kotlin/` - Native Android code (if needed)

---

### 3. `ios/` - iOS Platform Integration

**Purpose**: Contains iOS-specific configurations, Xcode project files, and native code.

**Key Files**:

* `ios/Runner/Info.plist` - iOS app configuration and permissions
* `ios/Runner.xcodeproj/` - Xcode project configuration
* `ios/Runner/AppDelegate.swift` - iOS app lifecycle management

---

### 4. `web/` - Web Platform Support

**Purpose**: Contains web-specific files for running Flutter apps in browsers.

**Key Files**:

* `web/index.html` - Main HTML entry point
* `web/manifest.json` - Progressive Web App configuration
* `web/icons/` - Web app icons

---

### 5. `test/` - Testing Framework

**Purpose**: Contains all test files for ensuring code quality and functionality.

**Types of Tests**:

* Unit tests
* Widget tests
* Integration tests

Default file: `widget_test.dart`

---

### 6. `pubspec.yaml` - Project Configuration

**Purpose**: The heart of Flutter project configuration, managing dependencies, assets, and metadata.

**Key Responsibilities**:

* Dependency management
* Asset registration
* Font configuration
* Versioning

---

### 7. Platform-Specific Desktop Folders

`linux/`, `macos/`, `windows/` enable Flutter apps to run on desktop platforms with native performance.

---

### 8. Supporting Configuration Files

| File                    | Purpose                         |
| ----------------------- | ------------------------------- |
| `.gitignore`            | Files Git should ignore         |
| `.metadata`             | Flutter SDK project metadata    |
| `analysis_options.yaml` | Dart linting and analyzer rules |
| `pubspec.lock`          | Locks dependency versions       |

---

## Assets Management

### Example Structure

```
assets/
├── images/
├── fonts/
└── data/
```

### Registering Assets

```yaml
flutter:
  assets:
    - assets/images/
```

---

## Best Practices for Organization

* Use modular folder structure
* Separate UI, business logic, and data
* Group files by feature where possible
* Keep reusable components in `widgets/`

---

## IDE Folder View Screenshot

A screenshot of the project folder structure as displayed in the IDE is included in:

`docs/screenshots/`

---

## Reflection

Understanding the Flutter project structure helps developers quickly locate files, separate UI from logic, and manage platform-specific configurations efficiently. In team environments, this structured approach reduces confusion, avoids code conflicts, and supports scalable feature development.

---

## Conclusion

Flutter’s structured organization enables cross-platform development while maintaining platform-specific optimization. This layout supports scalability, collaboration, and maintainability — key requirements for modern app development.
