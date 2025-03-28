# flutter_umeng_common

友盟统计插件

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

