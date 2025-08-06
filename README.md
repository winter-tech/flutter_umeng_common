友盟统计插件,支持安卓、iOS和鸿蒙

## 接入文档

初始化
```
    FlutterUmengCommon.init(
      androidAppKey: 'xxxxxx',
      iosAppKey: 'xxxxxx',
      channel: 'xiaomi',
    );
```

埋点
```
    FlutterUmengCommon.onEvent('test', {
      'test': 'test',
      'test1': 1,
    });
```

### 鸿蒙配置

1、在项目的AppScope/resources/rawfile目录下新增一个配置文件umconfig.json
```
{
  "appKey": "你的apppkey",
  "channel": "你的渠道"
}
```
2、在模块的module.json5文件中添加权限声明
```
"requestPermissions": [
  {
    "name": "ohos.permission.APP_TRACKING_CONSENT",
    "reason": "$string:reason", // 如果IDE提示错误，需自行在entry/src/main/resources/base/element/string.json，中添加对应信息
    "usedScene": {}
  },
  {
    "name": "ohos.permission.INTERNET"
  },
  {
    "name": "ohos.permission.GET_NETWORK_INFO"
  },
],

{
  "string": [
    {
      "name": "reason",
      "value": "采集oaid信息用于统计分析"
    },
  ]
}
```
