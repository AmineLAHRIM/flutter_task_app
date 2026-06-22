# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
# Install dependencies
flutter pub get

# Run the app
flutter run

# Analyze / lint
flutter analyze

# Run all tests
flutter test

# Run a single test file
flutter test test/widget_test.dart

# Build
flutter build apk        # Android
flutter build ios        # iOS

# Regenerate JSON serialization code (run after changing any @JsonSerializable model)
flutter pub run build_runner build

# Watch mode for code generation during development
flutter pub run build_runner watch
```

## Backend Configuration

Before running, set the REST API base URL in `lib/constant.dart`:

```dart
class Constant {
  static final String REST_URL = 'http://<your-server>:<port>/taskapp';
}
```

All three services (`TaskService`, `UserService`, `UserTaskDetailService`) build their endpoint URLs from this constant.

## Architecture

### State Management

The app uses **Provider v3** (`ChangeNotifier` pattern). Three services are registered as `ChangeNotifierProvider`s at the root in `main.dart`:

- `UserService` — user CRUD + login + `SharedPreferences` persistence
- `TaskService` — task CRUD
- `UserTaskDetailService` — join-table service linking users to tasks; used to load assignee avatars on task cards

### Auth Flow

`main.dart` renders a `Home` widget on startup that checks `SharedPreferences` for a saved `userId`. If found, it navigates to `HomeScreen`; otherwise it shows `LoginScreen`. After login/signup, the `userId` is persisted via `UserService.saveUserMemory()`.

Named routes: `LoginScreen.routeName = 'login'`, `HomeScreen.routeName = '/home'`. The `HomeScreen` receives the `userId` as a route argument.

### Data Models & Code Generation

Models live in `lib/models/` and use `json_annotation` + `json_serializable`. The `.g.dart` files (e.g., `task.g.dart`) are **generated** — never edit them by hand. Always run `build_runner build` after modifying a model annotated with `@JsonSerializable`.

`TaskStatus` is an enum with four values used throughout the UI for colour coding:
```dart
enum TaskStatus { Task, Doing, Done, Important }
```
`AppTheme.taskStatusColors` maps to these by index.

### Responsive Sizing

`SizeConfig` (a static singleton in `lib/size_config.dart`) is initialized in `main.dart` inside a `LayoutBuilder` + `OrientationBuilder` before the `MultiProvider`/`MaterialApp` tree. The app is locked to portrait orientation. Use `SizeConfig.screenWidth`, `SizeConfig.heightMultiplier`, etc. for responsive measurements.

### Theming

All colours, text styles, and theme data are in `lib/style.dart` (`AppTheme`). Use `Theme.of(context).textTheme.headlineN` for text; do not define inline text styles.
