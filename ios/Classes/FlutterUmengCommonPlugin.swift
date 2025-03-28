import Flutter
import UIKit
import UMCommon

public class FlutterUmengCommonPlugin: NSObject, FlutterPlugin {

    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "flutter_umeng_common", binaryMessenger: registrar.messenger())
        let instance = FlutterUmengCommonPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "init":
            handleInit(call, result: result)
        case "onEvent":
            handleOnEvent(call, result: result)
        default:
            result(FlutterMethodNotImplemented)
        }
    }

    // 友盟初始化
    private func handleInit(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        guard let args = call.arguments as? [String: Any],
              let iosAppKey = args["iosAppKey"] as? String,
              let channel = args["channel"] as? String else {
            result(false)
            return
        }

        UMConfigure.initWithAppkey(iosAppKey, channel: channel)
        UMConfigure.setLogEnabled(true)  // 开启日志
        result(true)
    }

    // 友盟事件上报
    private func handleOnEvent(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        guard let args = call.arguments as? [String: Any],
              let event = args["event"] as? String,
              let properties = args["properties"] as? [String: Any] else {
            result(false)
            return
        }

        var eventProperties = [String: String]()
        for (key, value) in properties {
            eventProperties[key] = "\(value)"
        }

        MobClick.event(event, attributes: eventProperties)
        result(true)
    }
}
