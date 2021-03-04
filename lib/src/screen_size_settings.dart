// Copyright (c) 2021, the MarchDev Toolkit project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// Holder of max size of different screens
class ScreenSizeSettings {
  /// Creates screen size settings for portrait orientation
  const ScreenSizeSettings.portrait({
    this.watch = 220,
    this.smallMobile = 360,
    this.mediumMobile = 400,
    this.largeMobile = 600,
    this.smallTablet = 720,
    this.largeTablet = 840,
  });

  /// Creates screen size settings for landscape orientation
  const ScreenSizeSettings.landscape({
    this.watch = 220,
    this.smallMobile = 600,
    this.mediumMobile = 720,
    this.largeMobile = 960,
    this.smallTablet = 1024,
    this.largeTablet = 1280,
  });

  /// Maximum size of wristwatch
  final double watch;

  /// Maximum size of small mobile phone
  final double smallMobile;

  /// Maximum size of middle mobile phone
  final double mediumMobile;

  /// Maximum size of large mobile phone
  final double largeMobile;

  /// Maximum size of small tablet phone
  final double smallTablet;

  /// Maximum size of large tablet phone
  final double largeTablet;
}
