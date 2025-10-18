import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller = window?.rootViewController as! FlutterViewController
    let channel = FlutterMethodChannel(name: "com.example/native",
                                       binaryMessenger: controller.binaryMessenger)

    channel.setMethodCallHandler { (call, result) in
      if call.method == "writeHello",
         let args = call.arguments as? [String: Any],
         let n = args["n"] as? Int {

        // 👇 ЭТА СТРОКА ОБЯЗАТЕЛЬНА — вызов C++
        let cString = writeHelloAndReturnContent(Int32(n))
        let content = String(cString: cString!)
        result(content)
      } else {
        result(FlutterMethodNotImplemented)
      }
    }

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}