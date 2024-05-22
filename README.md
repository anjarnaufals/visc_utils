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

Based on the following references:
https://m3.material.io/foundations/layout/applying-layout/window-size-classes

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

https://matthewjamestaylor.com/responsive-padding#:~:text=Optimal%20Padding%20Sizes%20Per%20Screen,progressively%20wider%20for%20larger%20screens.

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
https://api.flutter.dev/flutter/material/TextTheme-class.html
https://m3.material.io/styles/typography/type-scale-tokens
https://fluent2.microsoft.design/layout

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
	padding: viscHorizontalMargin,
	child: YourWidget(),
	),
),
```

- Responsive Padding Horizontal

```dart
Padding(
	padding: viscHorizontalPadding,
	child: YourWidget(),
	),
),
```

- Responsive Padding Vertical

```dart
Padding(
	padding: viscVerticalPadding,
	child: YourWidget(),
	),
),
```

- Responsive Padding All

```dart
Padding(
	padding: viscAllPadding,
	child: YourWidget(),
	),
),
```

- Responsive Font Size

```dart
 Text(
          'Display Large',
          style: ViscTypo.displayLarge(context),
        ),
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
