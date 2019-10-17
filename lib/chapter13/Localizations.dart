import 'package:flutter/material.dart';

/// 实现Localizations类
class DemoLocalizations{
  DemoLocalizations(this.isZh);

  // 默认为中文
  bool isZh = true;

  // 定义静态方法,可直接通过tooltip: MaterialLocalizations.of(context).backButtonTooltip调用
  static DemoLocalizations of(BuildContext context){
    return Localizations.of<DemoLocalizations>(context, DemoLocalizations);
  }

  // Locale相关值,需要切换的值
  String get title{
    return isZh ? "learnFlutter应用" : "learnFlutter APP";
  }

  String get testText{
    return isZh ? "测试语言种类" : "Test Language kind";
  }
}