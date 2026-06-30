# swift-color

![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

Converts colors between standards — sRGB, Oklab, Oklch, and CIE LAB/LCH — through a single canonical interchange type, and pairs values across light and dark themes.

---

## Key Features

- **Canonical interchange** — every color space converts to and from one hub type (`Color`), so N standards need N conversions rather than N×N.
- **Perceptual color spaces** — Oklab and Oklch (CSS Color Level 4), alongside CIE LAB and LCH.
- **sRGB** — IEC 61966-2-1 sRGB and linear sRGB, with gamma encoding and D65 chromatic adaptation applied during conversion.
- **Protocol-driven conversion** — conform a type to `Color.Protocol` (`canonical()` / `init(_:)`) and `converted(to:)` reaches every other conforming standard.
- **Terminal color** — convert to ECMA-48 SGR codes for truecolor (`sgr`), the 256-color palette (`sgr256`), and the 16-color ANSI palette (`sgrPalette`).
- **Theme products** — `Theme` (light/dark) generates a homogeneous `Theme.Product<V>` (≅ V²) with subscript selection, `map`, and `zip`.
- **Value semantics** — color and theme types are `Sendable` and `Hashable` structs.

---

## Quick Start

```swift
import Color

// Every color space converts through one canonical hub (Color),
// so N standards need N conversions instead of N×N.
let red = Color.Oklch(l: 0.628, c: 0.258, h: 29.2)

// Perceptual hue rotation: shift the hue, hold lightness and chroma.
let cyan = Color.Oklch(l: red.l, c: red.c, h: red.h + 180)

// Reach any other conforming standard through the hub.
let lab = cyan.converted(to: Color.LAB.self)
let roundTrip = Color.Oklch(lab.canonical())

// Pair one value per appearance mode, then select at runtime.
let surface: Theme.Product<Color> = .init(light: .white, dark: .black)
let current = surface[.dark]   // .black
```

---

## Installation

```swift
dependencies: [
    .package(url: "https://github.com/swift-foundations/swift-color.git", branch: "main")
]
```

```swift
.target(
    name: "YourTarget",
    dependencies: [
        .product(name: "Color", package: "swift-color"),
    ]
)
```

Requires Swift 6.3.1 and macOS 26 / iOS 26 / tvOS 26 / watchOS 26 / visionOS 26.

---

## Community

<!-- BEGIN: discussion -->
*Discussion thread will be created at first public flip.*
<!-- END: discussion -->

## License

Apache 2.0. See [LICENSE](LICENSE.md).
