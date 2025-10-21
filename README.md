# 🚀 Counter App

A sophisticated Flutter counter application featuring custom increment/decrement values, responsive design, and clean architecture principles.

## ✨ Features

### 🎯 Core Functionality
- **Custom Increment/Decrement Values**: Set any integer value for incrementing or decrementing
- **Negative Number Support**: Counter can go below zero (no artificial limitations)
- **Reset Functionality**: Resets both counter value and input fields to defaults
- **Real-time Input Validation**: Handles invalid inputs gracefully

### 📱 Responsive Design
- **Orientation-Aware Layout**: Adapts to portrait/landscape orientations
- **Tablet Optimization**: Automatically detects and optimizes for tablet screens
- **Smart Layout Selection**:
  - Portrait phones: Two-row button layout
  - Landscape phones: Single-row button layout
  - Tablets: Single-row layout (any orientation)

### 🎨 Modern UI/UX
- **Material 3 Design**: Latest Material Design system implementation
- **Custom Button Components**: Reusable, stylable button widgets
- **Semantic Color Coding**:
  - 🔴 Red: Decrement operations
  - 🟢 Green: Increment operations
  - 🟠 Orange: Reset operations
- **Intuitive Layout**: Primary actions side-by-side, secondary actions below

### 🏗️ Clean Architecture
- **Separation of Concerns**: Business logic separated from UI components
- **Reusable Components**: Custom button widget for consistent styling
- **Organized Structure**: Functions, widgets, and views in dedicated folders
- **Maintainable Code**: Easy to extend and modify

## 📁 Project Structure

```
lib/
├── main.dart                    # Application entry point
├── core/
│   ├── my_app.dart             # App configuration and theming
│   ├── views/
│   │   └── my_homepage.dart    # Main UI component with responsive layout
│   ├── widgets/
│   │   └── custom_button.dart  # Reusable button component
│   └── functions/
│       └── counter_functions.dart # Business logic for counter operations
├── android/                    # Android platform files
├── ios/                       # iOS platform files
├── web/                       # Web platform files
└── README.md                  # Project documentation
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.0.0 or higher)
- Dart SDK (2.19.0 or higher)
- Android Studio or VS Code with Flutter extensions

### Installation

1. **Clone the repository:**
   ```bash
   git clone <repository-url>
   cd counter_app
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the application:**
   ```bash
   # For Android Emulator
   flutter run

   # For iOS Simulator (macOS only)
   flutter run

   # For Web
   flutter run -d web

   # For specific device
   flutter run -d <device-id>
   ```

## 📖 Usage Guide

### Basic Operations

1. **Set Custom Values**:
   - Enter desired increment value in "Increment by" field
   - Enter desired decrement value in "Decrement by" field

2. **Perform Operations**:
   - **Increment**: Tap the green "+" button to increase counter
   - **Decrement**: Tap the red "-" button to decrease counter
   - **Reset**: Tap the orange refresh button to reset everything

3. **Orientation Handling**:
   - **Portrait**: Buttons arranged in two rows for better mobile experience
   - **Landscape**: All buttons in single row for optimal space usage
   - **Tablet**: Single-row layout regardless of orientation

### Example Usage Scenarios

**Scenario 1: Basic Counting**
```
Increment by: 1    Decrement by: 1
[Counter: 0]
Click [+] → Counter: 1
Click [-] → Counter: 0
Click [Reset] → Counter: 0, Fields: 1
```

**Scenario 2: Custom Values**
```
Increment by: 5    Decrement by: 3
[Counter: 10]
Click [+] → Counter: 15
Click [-] → Counter: 12
Click [Reset] → Counter: 0, Fields: 1
```

**Scenario 3: Negative Numbers**
```
Increment by: 10   Decrement by: 15
[Counter: 5]
Click [-] → Counter: -10
Click [+] → Counter: 0
```

## 🔧 Technical Implementation

### Architecture Overview

#### Business Logic Layer (`lib/core/functions/`)
```dart
class CounterState {
  int _value;

  void incrementBy(int value) => _value += value;
  void decrementBy(int value) => _value -= value;
  void reset() => _value = 0;
  int get value => _value;
}
```

#### UI Components (`lib/core/widgets/`)
```dart
class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData icon;
  final String label;
  final ButtonType buttonType;

  // Material 3 styling with semantic colors
}
```

#### Responsive Layout (`lib/core/views/`)
```dart
Widget _buildResponsiveLayout(BuildContext context) {
  return _isTabletOrLandscape(context)
      ? _buildSingleRowLayout()  // For tablets/landscape
      : _buildTwoRowLayout();    // For portrait phones
}
```

### Key Technical Features

#### 1. Orientation Detection
```dart
bool _isTabletOrLandscape(BuildContext context) {
  final Size screenSize = MediaQuery.of(context).size;
  final Orientation orientation = MediaQuery.of(context).orientation;

  return orientation == Orientation.landscape || screenSize.width > 600;
}
```

#### 2. Custom Button Component
- **Type-safe button types**: `ButtonType.increment`, `ButtonType.decrement`, `ButtonType.reset`
- **Semantic color system**: Uses Material 3 color roles
- **Consistent styling**: Unified look across all buttons
- **Flexible configuration**: Customizable colors and behavior

#### 3. Input Validation
```dart
void _incrementCounter() {
  setState(() {
    final int value = int.tryParse(_incrementController.text) ?? 1;
    counterState.incrementBy(value);
  });
}
```

#### 4. State Management
- **Global counter state**: Shared across entire app
- **TextEditingController management**: Proper disposal and lifecycle
- **Reactive UI updates**: Automatic rebuilds on state changes

## 🎨 Design System

### Color Scheme (Material 3)
- **Primary Color**: Deep Purple (seed color)
- **Error Color**: Red (for decrement operations)
- **Secondary Color**: Purple (for reset operations)
- **Success Color**: Green (for increment operations)

### Typography
- **Display Text**: Counter value (headlineMedium)
- **Body Text**: Instructions and labels
- **Button Text**: Action labels (fontWeight.w600)

### Spacing System
- **Component Spacing**: 16px between related elements
- **Section Spacing**: 24-32px between major sections
- **Edge Margins**: 24px on mobile, 16px on landscape/tablet

## 📱 Responsive Breakpoints

| Device Type | Screen Width | Layout Type | Button Arrangement |
|-------------|-------------|-------------|-------------------|
| Portrait Phone | ≤ 600px | Two-row | [Dec][Inc] + [Reset] |
| Landscape Phone | Any | Single-row | [Dec][Inc][Reset] |
| Tablet | > 600px | Single-row | [Dec][Inc][Reset] |

## 🧪 Testing

### Manual Testing Checklist

#### Functionality Testing
- [ ] Custom increment values work correctly
- [ ] Custom decrement values work correctly
- [ ] Negative numbers are supported
- [ ] Reset button clears counter and input fields
- [ ] Invalid input defaults to 1

#### Responsive Testing
- [ ] Portrait phone layout displays correctly
- [ ] Landscape phone layout displays correctly
- [ ] Tablet layout displays correctly
- [ ] Orientation changes work smoothly
- [ ] Layout adapts properly on different screen sizes

#### UI Testing
- [ ] All buttons are properly styled
- [ ] Input fields accept numeric input
- [ ] Material 3 design is consistent
- [ ] Touch targets are appropriately sized

## 🚀 Deployment

### Build Commands

```bash
# Debug APK
flutter build apk --debug

# Release APK
flutter build apk --release

# Debug iOS
flutter build ios --debug

# Release iOS
flutter build ios --release

# Web Build
flutter build web

# Desktop Builds
flutter build windows
flutter build macos
flutter build linux
```

### Platform Support
- ✅ **Android**: Full support with Material Design
- ✅ **iOS**: Full support with Cupertino integration
- ✅ **Web**: Responsive web application
- ✅ **Windows**: Desktop application
- ✅ **macOS**: Desktop application
- ✅ **Linux**: Desktop application

## 🔮 Future Enhancements

### Potential Features
- **Animation System**: Smooth transitions between values
- **History Tracking**: Keep track of counter history
- **Preset Values**: Quick-select buttons for common values
- **Sound Effects**: Audio feedback for button presses
- **Themes**: Dark/light theme switching
- **Accessibility**: Enhanced screen reader support
- **Internationalization**: Multi-language support

### Technical Improvements
- **State Management**: Provider/Riverpod integration
- **Testing Suite**: Unit and integration tests
- **Performance**: Optimization for large counter values
- **Offline Support**: Local storage for counter state
- **Analytics**: Usage tracking and insights

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

## 👥 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

### Development Setup
1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## 📞 Support

For support and questions:
- Create an issue in the repository
- Check existing documentation
- Review the Flutter documentation

---

**Built with ❤️ using Flutter and Material Design 3**
