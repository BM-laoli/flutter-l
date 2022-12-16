# flutter 的练习场

## hot load

> 目前这个东西，现在还是有些问题的，我们使用这样的方式来处理

> 公司的电脑 不顶用 需要cd 到  download 下把 flutter cli搞上; 然后就是IOS 的热更新有点问题，你需要这样运行( 之前这个是有他的有关的issue 我给忘记啦 ，遇到在说)

```shell
export PATH="$PATH:`pwd`/flutter/bin"

# 在 当前shell 窗口cd 到目录下去
flutter run 

```

## demo

> DemoXXX 下都是和官方文档相关的具体实践，

## templateProject

> 这个下面是一个 项目模板有关的东西，来源自掘金 [Flutter 框架搭建](https://juejin.cn/column/7041029900316180494 )
> json这个插件，我不得不 使用AndroidStudio 开发，不过相比之下 flutter 开发中 androidStudio 确实要比vscode 更加的高效和便捷

> 就来讲讲道理，全部的文件都应该收敛到templayeProject 目录下，但是由于用来一些pluging都是项目级别的setting ，我就没有去改他们的设置了
> module& generated.json & res/string_res 为了配合 IDE插件和 sdk要求，就统统放在外面了


## 疑难杂症

1. 关于 webview_flutter的问题，我看一下，既然它的lib中写的android gralod 写目标是32 最低是19，那么我就使用它提供的版本去配置了

```
android {
    //    compileSdkVersion flutter.compileSdkVersion
    compileSdkVersion 32
    //....
    defaultConfig {
      minSdkVersion 19
      targetSdkVersion 32
    }
}

```
这样问题就处理了

2. 关于找不到ios 模拟器，无法识别的问题，请使用最新的Xcode13，被逼无奈还是得升级catlina 系统 