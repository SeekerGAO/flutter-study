import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'Localizations.dart';

/// 实现Delegate类
class DemoLocalizationsDelegate
    extends LocalizationsDelegate<DemoLocalizations> {
  const DemoLocalizationsDelegate();

  // Flutter会调用此类加载相应的Locale资源类
  @override
  Future<DemoLocalizations> load(Locale locale) {
    // TODO: implement load
    return SynchronousFuture<DemoLocalizations>(
        DemoLocalizations(locale.languageCode == 'zh'));
  }

  @override
  bool isSupported(Locale locale) {
    // TODO: implement isSupported
    // 返回某个支持的语言
    return ['en', 'zh'].contains(locale.languageCode);
  }

  @override
  bool shouldReload(LocalizationsDelegate<DemoLocalizations> old) {
    // TODO: implement shouldReload
    // 返回值决定当Localizations组件重新build时，是否调用load方法重新加载Locale资源
    return false;
  }
}
