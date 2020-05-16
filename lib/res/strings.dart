import 'package:artifact/res/strings_zh.dart';

Strings _res = StringsZh();

Strings get res => _res;

abstract class Strings {

  get appName;
  
  get menuWidget;

  get testImage;

  get testImageUrl;

  get testImageMinUrl;

  get testContainer;
}

abstract class BaseStrings implements Strings {
  @override
  get appName => "Flutter利器";
}
