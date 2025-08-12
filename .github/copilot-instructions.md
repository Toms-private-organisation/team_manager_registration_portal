# Team Manager Registration Portal - Flutter Web Application

Always reference these instructions first and only fallback to search or bash commands when you encounter unexpected information that does not match the info here.

This is a Flutter web application for team manager registration using Flutter 3.19.6, built with Riverpod for state management, GoRouter for navigation, and includes internationalization support.

## Working Effectively

### Initial Setup and Installation
- Install Flutter 3.19.6 exactly: `git clone https://github.com/flutter/flutter.git -b stable --depth 1 /opt/flutter`
- Add Flutter to PATH: `export PATH="$PATH:/opt/flutter/bin"`
- Verify installation: `flutter --version`
- If Flutter installation fails with Dart SDK download issues, you may need network access to `storage.googleapis.com`. Document this limitation in your environment.

### Environment Configuration
- **Environment files**: `.env`, `.env.dev`, `.env.stage` in assets/ directory
- Check these files for API endpoints, configuration values, and environment-specific settings
- Ensure the correct environment file is used for your development/deployment target

### Essential Build Commands
Run these commands in sequence from the project root directory:

1. **Install dependencies**: `flutter pub get` - takes 2-3 minutes. NEVER CANCEL. Set timeout to 10+ minutes.
2. **Enable web support**: `flutter config --enable-web` - takes 1-2 minutes.
3. **Generate project structure**: `flutter create .` - takes 2-3 minutes. This regenerates missing Flutter project files.
4. **Generate translations**: `flutter pub run fast_i18n` - takes 1-2 minutes. Required for internationalization.
5. **Build for web**: `flutter build web -t lib/main.dart --pwa-strategy=none` - takes 5-10 minutes. NEVER CANCEL. Set timeout to 20+ minutes.

### Development Workflow
- **Run development server**: `flutter run -d web-server --web-port=8080` - starts development server on localhost:8080
- **Hot reload**: Press `r` in the Flutter console to hot reload changes
- **Hot restart**: Press `R` in the Flutter console to hot restart the application
- **Stop server**: Press `q` in the Flutter console to quit

### Linting and Code Quality
- **Lint code**: `dart analyze` - checks for code issues and style violations
- **Format code**: `dart format .` - formats all Dart code in the project
- **Check formatting**: `dart format --output=show .` - shows what would be formatted without changing files
- **ALWAYS** run both analyze and format before committing changes

### Testing
- No test directory exists in this project - DO NOT create new tests unless specifically requested
- Verify functionality manually by running the development server and testing the web application
- Test the main user flows: home screen navigation, event signup, and route transitions

## Validation Scenarios

After making any changes, ALWAYS manually validate these core scenarios:

1. **Application Startup**: Navigate to localhost:8080 and verify the app loads without errors
2. **Navigation Flow**: Test navigation between routes (/, /event/:id) 
3. **Internationalization**: Verify that translation strings from `lib/i18n/strings.i18n.json` are displayed correctly
4. **Event Signup Flow**: Navigate to `/event/123` and verify the EventSignupScreen renders
5. **Responsive Design**: Test the app at different browser widths to ensure responsive behavior

### Docker Build and Deployment
- **Build Docker image**: `docker build -t team-manager-portal .` - takes 15-20 minutes. NEVER CANCEL. Set timeout to 30+ minutes.
- **Run Docker container**: `docker run -p 80:80 team-manager-portal`
- The Dockerfile serves the built web app using nginx-spa

## Project Structure and Navigation

### Key Directories and Files
```
lib/
├── main.dart              # Application entry point
├── GoRouter.dart          # Route configuration (/, /event/:id)
├── Constants/             # App constants and themes
├── dto/                   # Data transfer objects
├── entities/              # Data models
├── i18n/                  # Internationalization
│   └── strings.i18n.json # Translation strings (English base)
├── services/              # API and business logic services
├── ui/                    # User interface screens
│   ├── HomeScreen.dart           # Main landing page
│   ├── EventSignupScreen.dart    # Event registration screen
│   ├── deleteProfileScreen.dart  # Profile deletion screen
│   └── widgets/                  # Reusable UI components
└── uitls/                 # Utility functions

assets/
├── .env                   # Environment variables (production)
├── .env.dev              # Environment variables (development)
├── .env.stage            # Environment variables (staging)
├── svg/                   # SVG assets (marker.svg)
└── logo/alone/           # Logo assets (ALONE.png, ALONENOTEXT.png)
```

### Important Dependencies
- **flutter_riverpod**: State management - use for app state
- **go_router**: Navigation - configured in GoRouter.dart
- **dio**: HTTP client - use for API calls
- **slang/fast_i18n**: Internationalization - translations in i18n/
- **intl**: Date/time formatting
- **flutter_map**: Map integration
- **google_fonts**: Typography

### Route Configuration
- `/` - HomeScreen (main entry point)
- `/event/:id` - EventSignupScreen (dynamic event ID parameter)
- `/deleteProfile` - deleteProfileScreen

## Common Issues and Solutions

### Build Issues
- **Flutter SDK installation issues**: If `flutter` commands fail with SDK download errors, you may need access to `storage.googleapis.com`. In restricted environments:
  - Use GitHub Actions environment which has proper network access
  - Install Flutter using the GitHub Actions approach: Use `subosito/flutter-action@v2` with `flutter-version: '3.19.6'`
  - Alternatively, document the network limitation and provide manual workaround steps
- **Missing web support**: Run `flutter config --enable-web` before building
- **Translation errors**: Run `flutter pub run fast_i18n` to regenerate translation files
- **Build cache issues**: Run `flutter clean && flutter pub get` to clear cache

### Development Issues
- **Hot reload not working**: Use `flutter run -d web-server` instead of `flutter run -d chrome`
- **Asset not found**: Check assets are listed in pubspec.yaml under `flutter: assets:`
- **Import errors**: Ensure all dependencies are in pubspec.yaml and run `flutter pub get`

### Deployment Issues
- **Docker build fails**: Ensure `flutter build web` completed successfully before Docker build
- **Nginx serving issues**: The Dockerfile uses nginx-spa configuration for single-page app routing

## Timing Expectations

- **NEVER CANCEL** any build commands - they may take significant time
- Initial setup: 10-15 minutes total
- Full build cycle: 15-20 minutes 
- Development server startup: 30-60 seconds
- Hot reload: 1-2 seconds
- Docker build: 15-20 minutes

## CI/CD Integration

The `.github/workflows/main.yml` defines the complete CI/CD pipeline:
- Builds on Ubuntu with Flutter 3.19.6
- Deploys to Docker Hub as `tumels/websignpp:latest`
- Optional CapRover deployment with manual workflow trigger
- ALWAYS ensure your local build matches the CI pipeline steps

## Network Dependencies

This project requires network access to:
- `storage.googleapis.com` - Flutter/Dart SDK downloads
- `pub.dev` - Dart package dependencies
- Docker Hub - for deployment (if building containers)

Document any network limitations in your development environment and provide alternative setup instructions when needed.