# Scientific Calculator Flutter App

## Introduction

This is a **stylish and user-friendly scientific calculator** built using **Flutter**. It provides users with a simpler interface for performing advanced calculations such as logarithmic, trigonometric, and arithmetic operations. Unlike most scientific calculator apps, which are often complex and difficult to navigate, this app focuses on offering a **modern UI design** that aligns with today’s design trends, making it **intuitive** and easy to use for everyone.

The app features:
- **Basic arithmetic operations** (addition, subtraction, multiplication, and division)
- **Advanced logarithmic functions** (log, ln, antilog)
- **Trigonometric functions** (sin, cos, tan)
- **Clean and catchy UI**, making the app aesthetically appealing and simple to navigate

## Motivation

Many scientific calculators available today have overly complex designs that are difficult for users to operate efficiently. This app aims to simplify the experience with a **clear layout** and **easy-to-understand functionality** while providing the necessary features for advanced users. The design is intended to be visually appealing and modern, offering an enhanced user experience that fits well with current app design trends.

## Features

- **Logarithmic calculations**: Log, ln, antilog
- **Trigonometric calculations**: sin, cos, tan, and their inverse operations
- **Stylish, modern UI**: Designed to be simple, clean, and visually appealing
- **User-friendly interface**: Easy navigation for basic and advanced operations

## Dependencies

Below are the key dependencies used in this Flutter project:

1. **Flutter SDK**  
   - Version: `>=3.10.0 <4.0.0`
   - Flutter is the main framework used to build the app's UI and manage the state. It offers a wide variety of widgets for creating responsive and interactive apps across platforms.

2. **Dart**  
   - Version: `>=2.18.0 <4.0.0`
   - Dart is the programming language used in Flutter projects. It provides modern language features and supports efficient compilation to machine code, enabling smooth performance on mobile devices.

3. **math_expressions**  
   - Version: `^2.2.0`
   - This package is used to evaluate mathematical expressions, including advanced operations like logarithms and trigonometric functions. It allows you to build custom functions and parse mathematical expressions easily.

To install these dependencies, add them to your `pubspec.yaml` file as follows:

```yaml
dependencies:
  flutter:
    sdk: flutter
  math_expressions: ^2.2.0
```

Then, run the following command to install them:
```bash
flutter pub get
```

## Project Structure

Here is an overview of the main project structure:

```bash
lib/
├── calculator/
│   ├── drawer.dart                # Advanced operations dialog UI
│   ├── logarithmicDrawer.dart     # Logarithmic functions UI
│   ├── trignometricDrawer.dart    # Trigonometric functions UI
│   ├── trigoLogic.dart            # Custom trigonometric logic
│                   
├── main.dart                      # Main application code
├── HomeScreen.dart                # Welcome Screen 


### Key Components

1. **Advanced Operations Dialog** (`AdvancedOperationsDialog.dart`): Provides access to logarithmic, exponential, and trigonometric operations in a user-friendly dialog.
2. **Logarithmic Drawer** (`logarithmicDrawer.dart`): Handles user input for logarithmic functions.
3. **Trigonometric Drawer** (`trignometricDrawer.dart`): Manages trigonometric operations (sin, cos, tan).
4. **Trigonometric Logic** (`trigoLogic.dart`): Implements custom trigonometric operations using the `math_expressions` package.

## UI and Design

The app’s design focuses on simplicity while maintaining a stylish and modern look. It uses **clean layouts**, **clear fonts**, and **intuitive buttons** to make navigation straightforward. This design is meant to appeal to users who find typical scientific calculators difficult to operate due to cluttered interfaces.

The modern UI ensures a pleasant user experience that meets the expectations of today’s app users, balancing functionality and design.

## References

- **Flutter Documentation**: [https://flutter.dev/docs](https://flutter.dev/docs)
- **Dart Language**: [https://dart.dev](https://dart.dev)
- **math_expressions package**: [https://pub.dev/packages/math_expressions](https://pub.dev/packages/math_expressions)

## Future Scope

The current implementation of the scientific calculator focuses on core mathematical operations, including basic arithmetic, logarithmic, and trigonometric functions. However, there are several exciting directions for future development to enhance the app's capabilities:

## 1. **Calculus Mode **

Integration and Differentiation: Introduce features for calculus operations such as finding integrals and derivatives. This would include definite and indefinite integrals and various differentiation rules.
Graphing: Implement graphing functionalities to visualize functions, derivatives, and integrals. This could help users understand the behavior of functions more intuitively.


## 2. **Physics Mode**

- Advanced Physics Calculations: Include functionalities for physics-related calculations, such as kinematics, dynamics, and thermodynamics. This could cover topics like projectile motion, force, energy, and work.
Unit Conversions: Add a comprehensive unit conversion tool for physical quantities, which could support conversions between metric and imperial units, as well as between different physical units (e.g., Newtons to pounds-force).


3. Enhanced UI/UX

- Customizable Themes: Allow users to choose from various themes or create custom themes to personalize the app's appearance.
- Voice Input: Integrate voice recognition for inputting mathematical expressions and calculations, providing a more hands-free          experience.


4. Educational Features

- Tutorials and Help Sections: Provide in-app tutorials and help sections to guide users on how to use advanced features, understand mathematical concepts, and apply them effectively.
- Problem Solver: Implement a problem-solving assistant that can guide users through complex calculations and provide step-by-step solutions.