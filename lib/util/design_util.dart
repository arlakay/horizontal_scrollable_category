import 'package:learnrxdart/util/font_size_automation.dart';

class DesignUtil{

  static double fs8, fs10, fs12, fs13, fs14, fs15, fs16, fs18, fs20, fs22, fs24;
  static double fontSize(double height, double inputValue) {
    return FontSizeAutomation.fontSizeConfig(height, inputValue);
  }

  static void formatFont(double height) {
    fs8 = fontSize(height, 8);
    fs10 = fontSize(height, 10);
    fs12 = fontSize(height, 12);
    fs13 = fontSize(height, 13);
    fs14 = fontSize(height, 14);
    fs15 = fontSize(height, 15);
    fs16 = fontSize(height, 16);
    fs18 = fontSize(height, 18);
    fs20 = fontSize(height, 20);
    fs22 = fontSize(height, 22);
    fs24 = fontSize(height, 24);
  }
}