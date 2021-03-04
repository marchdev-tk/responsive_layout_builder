// Copyright (c) 2021, the MarchDev Toolkit project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/widgets.dart';

import 'layout_size.dart';
import 'screen_size.dart';
import 'screen_size_settings.dart';
import 'size_calculations.dart';

/// Signature for a function that builds a widget given an [LayoutSize].
///
/// Used by [ResponsiveLayoutBuilder.builder].
typedef Widget ResponsiveLayoutWidgetBuilder(
    BuildContext context, ScreenSize size);

/// Builds a widget tree that can depend on the parent widget's [LayoutSize] (orientation and layout).
///
/// Constraints are based on all available space that this widget can occupy, not on screen size
class ResponsiveLayoutBuilder extends StatefulWidget {
  /// Creates an responsive layout builder.
  ///
  /// The [builder], [portraitSizes] and [landscapeSizes] argument must not be null.
  const ResponsiveLayoutBuilder({
    Key? key,
    required this.builder,
    this.defaultSize = LayoutSize.mobile,
    this.portraitSizes = const ScreenSizeSettings.portrait(),
    this.landscapeSizes = const ScreenSizeSettings.landscape(),
  }) : super(key: key);

  /// Builds the widgets below this widget given this widget's [LayoutSize]
  final ResponsiveLayoutWidgetBuilder builder;

  /// Sets default size if no condition was passed
  ///
  /// Defaults to [LayoutSize.mediumMobile]
  final LayoutSize defaultSize;

  /// Sets screen sizes for different devices which affects on [LayoutSize]
  ///
  /// Defaults to [watch = 220], [smallMobile = 360], [middleMobile = 400], [largeMobile = 600], [smallTablet = 720], [largeTablet = 840]
  final ScreenSizeSettings portraitSizes;

  /// Sets screen sizes for different devices which affects on [LayoutSize]
  ///
  /// Defaults to [watch = 220], [smallMobile = 600], [middleMobile = 720], [largeMobile = 960], [smallTablet = 1024], [largeTablet = 1280]
  final ScreenSizeSettings landscapeSizes;

  @override
  _ResponsiveLayoutBuilderState createState() =>
      _ResponsiveLayoutBuilderState();
}

class _ResponsiveLayoutBuilderState extends State<ResponsiveLayoutBuilder> {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      key: widget.key,
      builder: (context, orientation) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return widget.builder(
              context,
              getScreenSize(
                orientation: orientation,
                defaultSize: widget.defaultSize,
                width: MediaQuery.of(context).size.width,
                sizes: orientation == Orientation.portrait
                    ? widget.portraitSizes
                    : widget.landscapeSizes,
              ),
            );
          },
        );
      },
    );
  }
}
