import AVFoundation
import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let deviceChannel = FlutterMethodChannel(name: "device/info",
                                              binaryMessenger: controller.binaryMessenger)
    let sensorChannel = FlutterMethodChannel(name: "device/sensor",
                                              binaryMessenger: controller.binaryMessenger)

    deviceChannel.setMethodCallHandler({
      [weak self] call, result in
      guard let self = self else { return }
      switch call.method {
      case "getBatteryLevel":
        self.receiveBatteryLevel(result: result)
      case "getDeviceName":
        result(UIDevice.current.name)
      case "getOSVersion":
        result("iOS \(UIDevice.current.systemVersion)")
      default:
        result(FlutterMethodNotImplemented)
      }
    })

    sensorChannel.setMethodCallHandler({
      [weak self] call, result in
      guard let self = self else {return}
      switch call.method {
        case "hasFlashlight":
          let device = AVCaptureDevice.default(for: .video)
          result(device?.hasTorch == true)
        case "toggleFlashlight":
          guard let args = call.arguments as? [String: Any],
            let enable = args["enable"] as? Bool
          else {
            result(false)
            return
          }
          toggleFlashlight(result: result, enable: enable)
        default:
          result(FlutterMethodNotImplemented)
      }
    })

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  private func receiveBatteryLevel(result: FlutterResult) {
    let device = UIDevice.current
    device.isBatteryMonitoringEnabled = true
    if device.batteryState == UIDevice.BatteryState.unknown {
      result(FlutterError(code: "UNAVAILABLE",
                          message: "Battery level not available.",
                          details: nil))
    } else {
      result(Int(device.batteryLevel * 100))
    }
  }

  private func toggleFlashlight(result: FlutterResult, enable: Bool) {
    let device = AVCaptureDevice.default(for: .video)
    if let device = device, device.hasTorch {
      do {
        try device.lockForConfiguration()
        if enable {
          try device.setTorchModeOn(level: 1.0)
        } else {
          device.torchMode = .off
        }
        device.unlockForConfiguration()
        result(true)
      } catch {
        result(false)
      }
    } else {
      result(false)
    }
  }
}
