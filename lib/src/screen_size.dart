// Copyright (c) 2021, the MarchDev Toolkit project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/widgets.dart';

import 'layout_size.dart';

/// [ScreenSize] stores data of [LayoutSize], [MobileLayoutSize] and [TabletLayoutSize]
class ScreenSize {
  /// Creates an instance of [ScreenSize] that stores data of [LayoutSize], [MobileLayoutSize] and [TabletLayoutSize]
  const ScreenSize({
    required this.size,
    this.mobile,
    this.tablet,
    this.orientation,
  });

  /// [size] is used for storing general screen type
  ///
  /// Could be [LayoutSize.watch], [LayoutSize.mobile], [LayoutSize.tablet], [LayoutSize.desktop] or [LayoutSize.tv]
  final LayoutSize size;

  /// [mobile] defines mobile screen type
  ///
  /// Could be [MobileLayoutSize.small], [MobileLayoutSize.medium] or [MobileLayoutSize.large]
  final MobileLayoutSize? mobile;

  /// [tablet] defines mobile screen type
  ///
  /// Could be [TabletLayoutSize.small] or [TabletLayoutSize.large]
  final TabletLayoutSize? tablet;

  /// [orientation] defines screen orientation
  ///
  /// Could be [Orientation.landscape] or [Orientation.portrait]
  final Orientation? orientation;
}
