# Nodelabs Case Study

![coverage][coverage_badge]
[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]

A Very Good Project created by Very Good CLI.

---

## Overview

**Nodelabs Case Study** is a cross-platform Flutter application built as a case study for **NodeLabs**. It is scaffolded with the [Very Good CLI](https://github.com/VeryGoodOpenSource/very_good_cli) and demonstrates scalable, maintainable architecture using the BLoC (Business Logic Component) pattern and modular repository-driven structure. The project is designed to run on iOS, Android, Web, and Windows, but for this case study, **only the development flavor is implemented**.

---

## Features

- **Development flavor only:** The project structure supports multiple flavors, but only the development flavor is implemented for this case study.
- **Internationalization:** Uses the `slang` package for easy and robust localization.
- **Authentication:** User sign-in and registration flows.
- **Profile Management:** User profile and photo update.
- **Feed:** Movie feed and favorite movies.
- **Theming:** Custom UI theme via the `nodelabs_ui` package.
- **Caching:** Local data caching using Hive.
- **Analytics:** Event tracking via an analytics repository.
- **Modular Repositories:** Separate packages for API, authentication, user, movie, cache, analytics, and external media.

---

## Project Structure

```
lib/
  app/                # App root, state, and main widget
  app_router/         # Routing and navigation (GoRouter)
  auth/               # Authentication screens and logic
  feed/               # Movie feed and related UI
  home/               # Home screen and navigation shell
  i18n/               # Localization files and generated code (slang)
  initialize/         # App initialization logic
  limited_offer/      # Limited offer UI components
  profile/            # User profile and related logic
  register/           # Registration flow
  sign_in/            # Sign-in flow
  update_photo/       # Update profile photo
  user_card/          # User card UI and logic
  utils/              # Utility functions (validators, messages)
  gen/                # Generated assets
  main_development.dart # Entry point for development flavor
```

**Packages:**

- `analytics_repository`, `auth_repository`, `cache_repository`, `external_media_repository`, `movie_repository`, `user_repository`, `api_client`, `hive_client`, `nodelabs_ui` — each with its own README and tests.

---

## Getting Started 🚀

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (see `pubspec.yaml` for version)
- Dart 3.5.0 or higher

### Running the App

Only the **development flavor** is implemented:

```sh
flutter run --flavor development --target lib/main_development.dart
```

_Nodelabs Case Study works on iOS, Android, Web, and Windows._

### Managing Dependencies and Cleaning Projects

To recursively clean all Flutter projects and fetch dependencies (including all packages), use the provided scripts in the `script/` directory:

#### Clean all Flutter projects/packages

```sh
bash script/flutter_clean.sh
```

#### Clean and fetch dependencies for all Flutter projects/packages

```sh
bash script/flutter_pub_get.sh
```

- By default, these scripts start from the project root and process every subdirectory containing a `pubspec.yaml` file.
- You can also provide a custom base directory as an argument:

```sh
bash script/flutter_clean.sh path/to/dir
bash script/flutter_pub_get.sh path/to/dir
```

> **Note:**
> If you get a 'Permission denied' error when running the scripts, make sure they are executable:
>
> ```sh
> chmod +x script/flutter_clean.sh
> chmod +x script/flutter_pub_get.sh
> ```
>
> You only need to do this once per script after cloning the repository.

---

## Architecture

- **State Management:** Uses [BLoC](https://bloclibrary.dev/) for business logic and state, with `flutter_bloc` for UI integration.
- **Routing:** [GoRouter](https://pub.dev/packages/go_router) for declarative, type-safe navigation.
- **Dependency Injection:** Uses `RepositoryProvider` and `MultiRepositoryProvider` for injecting repositories.
- **Modularity:** Core features are separated into packages and feature folders for scalability.
- **Persistence:** Local cache via Hive, abstracted by the `cache_repository` and `hive_client` packages.
- **API Communication:** All network calls are abstracted through the `api_client` package.

---

## Running Tests 🧪

To run all unit and widget tests:

```sh
flutter test --coverage --test-randomize-ordering-seed random
```

To view the generated coverage report:

```sh
# Generate Coverage Report
genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
open coverage/index.html
```

---

## Internationalization 🌐

- Uses the [`slang`](https://pub.dev/packages/slang) package for internationalization and localization.
- All localization files are located in `lib/i18n/` and are managed/generated by slang.
- To add a new string or locale, update the relevant files in `lib/i18n/` and regenerate the code using slang's build runner integration.
- For more information, see the [slang documentation](https://pub.dev/packages/slang).

---

## Assets

- All assets (icons, images) are located in the `assets/` directory and referenced in `pubspec.yaml`.
- Asset classes are generated in `lib/gen/assets.gen.dart`.

---

## Packages

Each package (e.g., `auth_repository`, `movie_repository`, etc.) contains:

- Its own README and documentation.
- Unit tests under `test/`.
- Strict linting and CI via [Very Good Analysis](https://pub.dev/packages/very_good_analysis).

---

## Contributing

- PR and issue templates are provided in each package.
- Code style and coverage are enforced via CI.

---

## License

MIT

---

## References

- [Very Good CLI](https://github.com/VeryGoodOpenSource/very_good_cli)
- [Bloc](https://bloclibrary.dev/)
- [GoRouter](https://pub.dev/packages/go_router)
- [Hive](https://pub.dev/packages/hive)
- [slang](https://pub.dev/packages/slang)

---

**Badges and links:**

- [coverage_badge]: coverage_badge.svg
- [very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
- [very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
- [license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
- [license_link]: https://opensource.org/licenses/MIT
