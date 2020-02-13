# responsive_layout_builder

Flutter package for building responsive layout based on screen sizes and orientation.
It could be wristwatch, small/medium/large mobile, small/large tablet or desktop.

## Getting Started

### Widget approach

`ResponsiveLayoutBuilder` could be used as usual widget builder such as `LayoutBuilder` or `OrientationBuilder`, etc.

```dart
ResponsiveLayoutBuilder(
    builder: (context, screenSize) {
        // Use size argument to build size dependent widgets
    },
),
```

`size` property within `screenSize` stores `LayoutSize` which could be `watch`, `mobile`, `tablet`, `desktop` or `tv`.

`mobile` property within `screenSize` stores `MobileLayoutSize` which could be `small`, `medium` or `large`.

`tablet` property within `screenSize` stores `TabletLayoutSize` which could be `small` or `large`.

### Functional approach

For using functional approach to retrieve current size use following:

```dart
// for getting mobile layout size 
getMobileLayoutSize(width: MediaQuery.of(context).size.width);

// for getting tablet layout size 
getTabletLayoutSize(width: MediaQuery.of(context).size.width);

// for getting screen size based on width
getScreenSize(width: MediaQuery.of(context).size.width);

// for getting screen size based on context 
getContextualScreenSize(context: context);
```

If you need to specify `ScreenSizeSettings` for all above functions `sizes` argument is needed to be passed, like this:

```dart
sizes: ScreenSizeSettings(...)
```

For `getScreenSize` and `getContextualScreenSize` could be specified also `orientation` and `defaultSize`.

## TODO

* Figure out how to determine TV
* Add tests
