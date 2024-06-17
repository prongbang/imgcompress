import Flutter
import UIKit

public class ImgcompressPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "imgcompress", binaryMessenger: registrar.messenger())
    let instance = ImgcompressPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("iOS " + UIDevice.current.systemVersion)
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  public func dummyMethodToEnforceBundling() {
    // This will never be executed
    dummy_method_to_enforce_bundling()
  }
}
