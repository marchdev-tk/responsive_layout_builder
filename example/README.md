# responsive_layout_builder_example

Demonstrates how to use the responsive_layout_builder plugin.

## Usage

```dart
class MyApp extends StatefulWidget {
  final navigatorKey = GlobalKey<NavigatorState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const Map<LayoutSize, String> layoutSizeEnumToString = {
    LayoutSize.watch: 'Wristwatch',
    LayoutSize.mobile: 'Mobile',
    LayoutSize.tablet: 'Tablet',
    LayoutSize.desktop: 'Desktop',
    LayoutSize.tv: 'TV',
  };
  static const Map<MobileLayoutSize, String> mobileLayoutSizeEnumToString = {
    MobileLayoutSize.small: 'Small',
    MobileLayoutSize.medium: 'Medium',
    MobileLayoutSize.large: 'Large',
  };
  static const Map<TabletLayoutSize, String> tabletLayoutSizeEnumToString = {
    TabletLayoutSize.small: 'Small',
    TabletLayoutSize.large: 'Large',
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: widget.navigatorKey,
      home: Scaffold(
        key: widget.scaffoldKey,
        appBar: AppBar(
          title: const Text('Responsive Layout Builder Example App'),
        ),
        body: ResponsiveLayoutBuilder(
          builder: (context, size) => Center(
                child: Column(
                  children: <Widget>[
                    Text('Layout Size: ${layoutSizeEnumToString[size.size]}'),
                    if (size.mobile != null)
                      Text(
                          'Mobile Size: ${mobileLayoutSizeEnumToString[size.mobile]}'),
                    if (size.tablet != null)
                      Text(
                          'Tablet Size: ${tabletLayoutSizeEnumToString[size.tablet]}'),
                  ],
                ),
              ),
        ),
      ),
    );
  }
}
```

## Getting Started

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
