// Copyright (c) 2020, the MarchDev Toolkit project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

import 'package:responsive_layout_builder/responsive_layout_builder.dart';

void main() => runApp(MyApp());

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
