import 'package:share/share.dart';

class BmiFunctions {
  void share(String shareText, String shareTextExtraction, String verse) {
    Share.share('$shareText', subject: '$shareTextExtraction $verse');
    print("shared");
  }
}
