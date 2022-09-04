package com.example.nus_launcher

import android.Manifest
import android.app.WallpaperManager
import android.content.pm.PackageManager
import android.graphics.Bitmap
import android.graphics.drawable.BitmapDrawable
import androidx.core.app.ActivityCompat
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.ByteArrayOutputStream


class MainActivity : FlutterActivity() {
    private val WALLPAPER_CHANNEL = "wallpaper"
    private lateinit var wallPaperChannel: MethodChannel

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        wallPaperChannel =
            MethodChannel(flutterEngine.dartExecutor.binaryMessenger, WALLPAPER_CHANNEL)

        wallPaperChannel.setMethodCallHandler { call, result ->
            if (call.method == "getWallpaper") {
//                val arguments = call.arguments<Map<String, String>>()
//                val name = arguments?.get("name")
             val byteArrayWallPaper =    getCurrentWallpaper()
                result.success(byteArrayWallPaper)

            }
        }
    }

    private fun getCurrentWallpaper(): ByteArray {

        val wallpaperManager = WallpaperManager.getInstance(this)
        if (ActivityCompat.checkSelfPermission(
                this,
                Manifest.permission.READ_EXTERNAL_STORAGE
            ) != PackageManager.PERMISSION_GRANTED
        ) {

            ActivityCompat.requestPermissions(
                this,
                arrayOf(Manifest.permission.READ_EXTERNAL_STORAGE),
                2
            )

        }
        val wallpaperDrawable = wallpaperManager.drawable
        val bitmap: Bitmap = (wallpaperDrawable as BitmapDrawable).bitmap
        val stream = ByteArrayOutputStream()
        bitmap.compress(Bitmap.CompressFormat.JPEG, 100, stream)
        return stream.toByteArray()
    }

    override fun onRequestPermissionsResult(
        requestCode: Int,
        permissions: Array<out String>,
        grantResults: IntArray
    ) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)

        if ((grantResults.isNotEmpty() &&
                    grantResults[0] == PackageManager.PERMISSION_GRANTED)) {
            getCurrentWallpaper()
        } else {
            // Explain to the user that the feature is unavailable because
            // the features requires a permission that the user has denied.
            // At the same time, respect the user's decision. Don't link to
            // system settings in an effort to convince the user to change
            // their decision.
        }
    }
}
