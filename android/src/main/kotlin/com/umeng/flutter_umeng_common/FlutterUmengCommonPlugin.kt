package com.umeng.flutter_umeng_common

import android.content.Context
import com.umeng.analytics.MobclickAgent
import com.umeng.commonsdk.UMConfigure
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler

/** FlutterUmengCommonPlugin */
class FlutterUmengCommonPlugin : FlutterPlugin, MethodCallHandler {

    private lateinit var channel: MethodChannel
    private lateinit var application: Context

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "flutter_umeng_common")
        channel.setMethodCallHandler(this)
        application = flutterPluginBinding.applicationContext
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "init" -> {
                val androidAppKey: String = call.argument<String>("androidAppKey") ?: ""
                val channel: String = call.argument("channel") ?: ""
                UMConfigure.preInit(application, androidAppKey, channel)
                UMConfigure.init(application, androidAppKey, channel, UMConfigure.DEVICE_TYPE_PHONE, "")
                result.success(true)
            }

            "onEvent" -> {
                val event = call.argument<String>("event") ?: ""
                val properties = call.argument<Map<String, Any>>("properties") ?: emptyMap()
                MobclickAgent.onEventObject(application, event, properties)
                result.success(true)
            }

            else -> {
                result.notImplemented()
            }
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
