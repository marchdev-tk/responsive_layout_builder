// Copyright (c) 2021, the MarchDev Toolkit project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/widgets.dart';

import 'layout_size.dart';
import 'screen_size.dart';
import 'screen_size_settings.dart';

/// Gets type of mobile layout size
///
/// [sizes] defaults to [ScreenSizeSettings.portrait()]
///
/// [width] must not be null
MobileLayoutSize getMobileLayoutSize({
  required double width,
  ScreenSizeSettings sizes = const ScreenSizeSettings.portrait(),
}) {
  MobileLayoutSize result;

  if (width > sizes.watch && width <= sizes.smallMobile) {
    result = MobileLayoutSize.small;
  } else if (width > sizes.smallMobile && width <= sizes.mediumMobile) {
    result = MobileLayoutSize.medium;
  } else {
    result = MobileLayoutSize.large;
  }

  return result;
}

/// Gets type of tablet layout size
///
/// [sizes] defaults to [ScreenSizeSettings.portrait()]
///
/// [width] must not be null
TabletLayoutSize getTabletLayoutSize({
  required double width,
  ScreenSizeSettings sizes = const ScreenSizeSettings.portrait(),
}) {
  TabletLayoutSize result;

  if (width > sizes.largeMobile && width <= sizes.smallTablet) {
    result = TabletLayoutSize.small;
  } else {
    result = TabletLayoutSize.large;
  }

  return result;
}

/// Gets type of screen size based on width
///
/// [sizes] defaults to [ScreenSizeSettings.portrait()]
/// [defaultSize] defaults to [LayoutSize.mobile]
///
/// [orientation] is mostly needed for [ResponsiveLayoutBuilder]
///
/// [width] must not be null
ScreenSize getScreenSize({
  required double width,
  Orientation? orientation,
  LayoutSize defaultSize = LayoutSize.mobile,
  ScreenSizeSettings sizes = const ScreenSizeSettings.portrait(),
}) {
  LayoutSize size;
  MobileLayoutSize? mobile;
  TabletLayoutSize? tablet;

  if (width <= sizes.watch) {
    size = LayoutSize.watch;
  } else if (width > sizes.watch && width <= sizes.largeMobile) {
    size = LayoutSize.mobile;
    mobile = getMobileLayoutSize(sizes: sizes, width: width);
  } else if (width > sizes.largeMobile && width <= sizes.largeTablet) {
    size = LayoutSize.tablet;
    tablet = getTabletLayoutSize(sizes: sizes, width: width);
  } else if (width > sizes.largeTablet) {
    size = LayoutSize.desktop;
  } else {
    size = defaultSize;
  }

  return ScreenSize(
    size: size,
    mobile: mobile,
    tablet: tablet,
    orientation: orientation,
  );
}

/// Gets type of screen size based on [BuildContext]
///
/// [sizes] defaults to [ScreenSizeSettings.portrait()]
/// [defaultSize] defaults to [LayoutSize.mobile]
///
/// [orientation] is mostly needed for [ResponsiveLayoutBuilder]
///
/// [context] must not be null
ScreenSize getContextualScreenSize({
  required BuildContext context,
  Orientation? orientation,
  LayoutSize defaultSize = LayoutSize.mobile,
  ScreenSizeSettings sizes = const ScreenSizeSettings.portrait(),
}) {
  return getScreenSize(
    width: MediaQuery.of(context).size.width,
    defaultSize: defaultSize,
    orientation: orientation,
    sizes: sizes,
  );
}
