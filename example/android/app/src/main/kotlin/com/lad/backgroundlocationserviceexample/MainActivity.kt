package com.march.eo.responsivelayoutbuilderexample

import android.Manifest
import android.os.Build
import android.os.Bundle
import android.content.pm.PackageManager
import android.util.Log

import io.flutter.app.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    GeneratedPluginRegistrant.registerWith(this)
    requestPermissions()
  }

  private fun requestPermissions() {
    if (Build.VERSION.SDK_INT < Build.VERSION_CODES.M) return

    val permissions = ArrayList<String>()

    var permissionCheck = checkSelfPermission(Manifest.permission.ACCESS_FINE_LOCATION)
    if (permissionCheck != PackageManager.PERMISSION_GRANTED)
      permissions.add(Manifest.permission.ACCESS_FINE_LOCATION)

    permissionCheck = checkSelfPermission(Manifest.permission.ACCESS_COARSE_LOCATION)
    if (permissionCheck != PackageManager.PERMISSION_GRANTED)
      permissions.add(Manifest.permission.ACCESS_COARSE_LOCATION)

    if (permissions.size > 0)
      requestPermissions(permissions.toTypedArray(), 1)
  }
}
