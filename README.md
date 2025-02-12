# Visc Utils

This package provides utility functions to create responsive margins, paddings, and font sizes in Flutter applications based on screen width. These utilities help in making your Flutter app adaptable to different screen sizes and devices, enhancing the overall UI/UX.

## Table of Contents

- [Features](#features)

- [Installation](#installation)

- [Prerequisites](#prerequisites)

- [Configuration](#configuration)

- [Usage](#usage)

- [Contributing](#contributing)

- [License](#license)

## Features

- **Responsive Margin**

Based on the following reference:

[Material Design M3 Window Size Classes](https://m3.material.io/foundations/layout/applying-layout/window-size-classes)

| Device Type | Size        | Description                                                         |
| ----------- | ----------- | ------------------------------------------------------------------- |
| Mobile      | Extra Small | 8.0 dp/lp - Compact, range in N < 600 dp/lp                         |
|             | Small       | 12.0 dp/lp - Compact, range in N < 600 dp/lp                        |
|             | Default     | 16.0 dp/lp - Compact, range in N < 600 dp/lp                        |
| Tablet      | Extra Small | 16.0 dp/lp - Medium, range between 600 - 839 dp/lp                  |
|             | Small       | 20.0 dp/lp - Medium, range between 600 - 839 dp/lp                  |
|             | Default     | 24.0 dp/lp - Medium, range between 600 - 839 dp/lp                  |
| Expanded    | Default     | 24.0 dp/lp - Large, usually desktop, range between 840 - 1599 dp/lp |
| Extra Large | Default     | 24.0 dp/lp - Large, usually desktop, range in N >= 1600 dp/lp       |

| Screen Width Range (px) | Margin Value (dp)   | Description     |
| ----------------------- | ------------------- | --------------- |
| < 600                   | `mobileDefault`     | Mobile          |
| 600 - 839               | `tabletDefault`     | Tablet          |
| 840 - 1599              | `expandedDefault`   | Expanded, Large |
| >= 1600                 | `extraLargeDefault` | Extra Large     |
| Default                 | `mobileDefault`     | Default margin  |

- **Responsive Padding**

Based on the following references:

[Optimal Padding Sizes Per Screen Width](https://matthewjamestaylor.com/responsive-padding#:~:text=Optimal%20Padding%20Sizes%20Per%20Screen,progressively%20wider%20for%20larger%20screens)

| Screen Width Range (px) | Padding (lp) | Description                |
| ----------------------- | ------------ | -------------------------- |
| <= 320                  | 13.0         | iPhone 4 & 5               |
| <= 360                  | 14.0         | Galaxy S5                  |
| <= 375                  | 15.0         | iPhone 6, 7, & 8           |
| <= 480                  | 16.0         | -                          |
| <= 768                  | 20.0         | iPad portrait              |
| <= 1024                 | 24.0         | iPad landscape             |
| <= 1280                 | 28.0         | -                          |
| <= 1536                 | 32.0         | -                          |
| <= 1920                 | 38.0         | -                          |
| <= 2560                 | 48.0         | -                          |
| > 2560                  | 48.0         | Default for larger screens |

- **Responsive Font Size**

Based on the following references:
[Flutter Material TextTheme Class](https://api.flutter.dev/flutter/material/TextTheme-class.html): Documentation on Flutter's `TextTheme` class for managing text styles in your Flutter app.

[Material M3 Typography Type Scale Tokens](https://m3.material.io/styles/typography/type-scale-tokens): Guidelines on typography and type scale tokens in Material Design M3, useful for consistent text styling.

[Fluent Design System 2 Layout](https://fluent2.microsoft.design/layout): Detailed guidance on layout principles in the Fluent Design System 2.

| Screen Width Range (px) | Multiplier         | Description       |
| ----------------------- | ------------------ | ----------------- |
| <= 479                  | `fontSize * 0.75`  | Small screens     |
| 480 - 639               | `fontSize * 0.875` | Medium screens    |
| 640 - 1023              | `fontSize`         | Large screens     |
| 1024 - 1365             | `fontSize * 1.125` | X-Large screens   |
| 1366 - 1919             | `fontSize * 1.25`  | XX-Large screens  |
| >= 1920                 | `fontSize * 1.5`   | XXX-Large screens |
| Default                 | `fontSize`         | Default font size |

| Method           | Font Size (dp/lp) | Description          |
| ---------------- | ----------------- | -------------------- |
| `bodySmall`      | 12                | Small body text      |
| `bodyMedium`     | 14                | Medium body text     |
| `bodyLarge`      | 16                | Large body text      |
| `labelSmall`     | 11                | Small label text     |
| `labelMedium`    | 12                | Medium label text    |
| `labelLarge`     | 14                | Large label text     |
| `titleSmall`     | 14                | Small title text     |
| `titleMedium`    | 16                | Medium title text    |
| `titleLarge`     | 22                | Large title text     |
| `headlineSmall`  | 24                | Small headline text  |
| `headlineMedium` | 28                | Medium headline text |
| `headlineLarge`  | 32                | Large headline text  |
| `displaySmall`   | 36                | Small display text   |
| `displayMedium`  | 45                | Medium display text  |
| `displayLarge`   | 57                | Large display text   |

- **Fluent Design System 2 Layout Reference**

For detailed guidance on layout in the Fluent Design System 2, refer to the [Fluent Design System 2 Layout](https://fluent2.microsoft.design/layout) documentation.

| Screen Size | Width Range (dp) | Breakpoint (px)   |
| ----------- | ---------------- | ----------------- |
| Small       | 320 - 479        | 640px or less     |
| Medium      | 480 - 639        | 641px to 1007px   |
| Large       | 640 - 1023       | 1008px and larger |
| X-Large     | 1024 - 1365      | 1008px and larger |
| XX-Large    | 1366 - 1919      | 1008px and larger |
| XXX-Large   | 1920 and up      | 1008px and larger |

- **Material Design M3 Window Size Classes Reference**

For detailed information on applying window size classes in Material Design M3, refer to the [Material Design M3 Window Size Classes](https://m3.material.io/foundations/layout/applying-layout/window-size-classes) documentation.

| Window Class | Breakpoint (dp)      | Common Devices                   |
| ------------ | -------------------- | -------------------------------- |
| Compact      | Width < 600          | Phone in portrait                |
| Medium       | 600 ≤ width < 840    | Tablet in portrait               |
|              |                      | Foldable in portrait (unfolded)  |
| Expanded     | 840 ≤ width < 1200\* | Phone in landscape               |
|              |                      | Tablet in landscape              |
|              |                      | Foldable in landscape (unfolded) |
|              |                      | Desktop                          |
| Large        | 1200 ≤ width < 1600  | Desktop                          |
| Extra-large  | 1600 ≤ width         | Desktop                          |
|              |                      | Ultra-wide                       |

## prerequisites

```yaml
environment:
sdk: ">=3.4.0 <4.0.0"
flutter: ">=1.17.0"
```

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  visc_utils:
    git:
      url: https://github.com/anjarnaufals/visc_utils
      ref: main
```

run pub upgrade

## Usage

- Responsive Margin

```dart
Padding(
	padding: viscHorizontalMargin(context),
	child: YourWidget(),
),
```

```dart
Padding(
	padding: viscVerticalMargin(context),
	child: YourWidget(),
),
```

```dart
Padding(
	padding: viscAllMargin(context),
	child: YourWidget(),
),
```

- Responsive Font Size

```dart
Text(
    'Display Large',
    style: ViscTypo.displayLarge(context),
),
```

- Fluent 2 layout size extension on BuildContext

```dart
	var screenSize = context.material3Layout;
```

- Flutent 2 Layout Widget

```dart
Builder(
	builder: (context) {
		return Fluent2LayoutWidget(
			small: yourSmallLayoutSystemWidget(),
			medium: yourMediumLayoutSystemWidget(),
			large: yourLargeLayoutSystemWidget(),
			xLarge: yourxLargeLayoutSystemWidget(),
			xxLarge: yourxxLargeLayoutSystemWidget(),
			xxxLarge: yourxxxLargeLayoutSystemWidget(),
		);
	},
),
```

- Material 3 layout size extension on BuildContext

```dart
	var screenSize = context.fluent2Layout;
```

- Material 3 Layout Widget

```dart
Builder(
	builder: (context) {
		return Material3LayoutWidget(
			compact: yourCompactLayoutSystemWidget(),
			medium: yourMediumLayoutSystemWidget(),
			large: yourLargeLayoutSystemWidget(),
			extraLarge: yourExtraLargeLayoutSystemWidget(),
			expanded: yourExpandedLargeLayoutSystemWidget(),
		);
	},
),
```


- Extension **fluent2LayoutValueOf**
```dart
final  something  =  context.fluent2LayoutValueOf<Alignment>(
	small:  Alignment.top,
	medium:  Alignment.bottomCenter,
	large:  Alignment.topCenter,
	xLarge:  Alignment.center,
	xxLarge:  Alignment.topRight,
	xxxLarge:  Alignment.topLeft,
);
```

- Extension **m3LayoutValueOf**
```dart
final  something  =  context.m3LayoutValueOf<BoxFit>(
	compact:  BoxFit.contain,
	medium:  BoxFit.cover,
	expanded:  BoxFit.fill,
	large:  BoxFit.fitWidth,
	extraLarge:  BoxFit.fitHeight,
);
```

## Contributing

We welcome contributions to Visc Utils. If you would like to contribute to the development or report issues, please follow these guidelines:

1. Fork the repository.

2. Create a new branch for your feature or bug fix.

3. Make your changes and commit them with descriptive messages.

4. Push your changes to your fork.

5. Submit a pull request to the main repository.

## License

No License
