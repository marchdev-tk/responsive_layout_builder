// Copyright (c) 2020, the MarchDev Toolkit project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// [LayoutSize] defines types of layout size
enum LayoutSize {
  /// [LayoutSize.watch] for wristwatch screen
  watch,

  /// [LayoutSize.mobile] for mobile screen
  mobile,

  /// [LayoutSize.tablet] for tablet screen
  tablet,

  /// [LayoutSize.desktop] for desktop screen
  desktop,

  /// [LayoutSize.tv] for TV screens
  ///
  /// Not used for now
  tv,
}

/// [MobileLayoutSize] defines types of mobile layout size
enum MobileLayoutSize {
  /// [MobileLayoutSize.small] for small mobile screen
  small,

  /// [MobileLayoutSize.medium] for medium mobile screen
  medium,

  /// [MobileLayoutSize.large] for large mobile screen
  large,
}

/// [TabletLayoutSize] defines types of tablet layout size
enum TabletLayoutSize {
  /// [TabletLayoutSize.small] for small tablet screen
  small,

  /// [TabletLayoutSize.large] for large tablet screen
  large,
}
