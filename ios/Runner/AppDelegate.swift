import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    /* let controller : FlutterViewController = window?.rootViewController as! FlutterViewController */
    GeneratedPluginRegistrant.register(with: self)

    guard let controller = window.rootViewController as? FlutterViewController else {
      fatalError("Invalid root view controller")
    }
    let batteryChannel = FlutterMethodChannel(name: "samples.flutter.dev/battery", binaryMessenger: controller.binaryMessenger)
    batteryChannel.setMethodCallHandler({(call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
      guard call.method == "getBatteryLevel" else {
        result(FlutterMethodNotImplemented)
        return
      }
      self.receiveBatteryLevel(result: result)
    })

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
  private func receiveBatteryLevel(result: FlutterResult) {
    // 回傳給flutter 100
    result(100)
  }
}
