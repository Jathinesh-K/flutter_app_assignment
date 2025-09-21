package com.example.device_sensor_info_app

import android.content.Context
import android.content.pm.PackageManager
import android.hardware.camera2.CameraAccessException
import android.hardware.camera2.CameraCharacteristics
import android.hardware.camera2.CameraManager
import android.os.BatteryManager
import android.os.Build
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val deviceChannel = "device/info"
    private val sensorChannel = "device/sensor";

    private var torchCameraId: String? = null

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, deviceChannel).setMethodCallHandler {
                call, result ->
            when (call.method) {
                "getBatteryLevel" -> {
                    val batteryLevel = getBatteryLevel()

                    if (batteryLevel != -1) {
                        result.success(batteryLevel)
                    } else {
                        result.error("UNAVAILABLE", "Battery level not available.", null)
                    }
                }
                "getDeviceName" -> result.success(getDeviceName())
                "getOSVersion" -> result.success(getOSVersion())
                else -> result.notImplemented()
            }
        }

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, sensorChannel).setMethodCallHandler {
                call, result ->
            when (call.method) {
                "hasFlashlight" -> result.success(packageManager.hasSystemFeature(PackageManager.FEATURE_CAMERA_FLASH))
                "toggleFlashlight" -> {
                    val enable = call.argument<Boolean>("enable") ?: false
                    val success = toggleTorch(enable)
                    result.success(success)
                }
                else -> result.notImplemented()
            }
        }
    }

    private fun getBatteryLevel(): Int {
        val batteryManager = getSystemService(Context.BATTERY_SERVICE) as BatteryManager
        return batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
    }

    private fun getDeviceName(): String = "${Build.MANUFACTURER} ${Build.MODEL}".trim()

    private fun getOSVersion(): String = "Android ${Build.VERSION.RELEASE}"

    private fun toggleTorch(enable: Boolean): Boolean {
        if (!packageManager.hasSystemFeature(PackageManager.FEATURE_CAMERA_FLASH)) return false
        val camManager = getSystemService(Context.CAMERA_SERVICE) as CameraManager
        if (!ensureTorchCameraId()) return false
        return try {
            camManager.setTorchMode(torchCameraId!!, enable)
            true
        } catch (e: CameraAccessException) {
            false
        }
    }

    private fun ensureTorchCameraId(): Boolean {
        if (torchCameraId != null) return true
        val camManager = getSystemService(Context.CAMERA_SERVICE) as CameraManager
        try {
            for (id in camManager.cameraIdList) {
                val chars = camManager.getCameraCharacteristics(id);
                val hasFlash = chars.get(CameraCharacteristics.FLASH_INFO_AVAILABLE) == true
                val facing = chars.get(CameraCharacteristics.LENS_FACING)
                if (hasFlash && facing == CameraCharacteristics.LENS_FACING_BACK) {
                    torchCameraId = id
                    return true
                }
            }
        } catch (e: Exception) {
            return false
        }
        return false
    }
}
