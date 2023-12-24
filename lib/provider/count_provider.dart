import 'package:adv_test_app/model/count.dart';
import 'package:flutter/cupertino.dart';

class CountProvider extends ChangeNotifier {
  CountModel countModel = CountModel(count: 1);

  void increase() {
    countModel.count++;
    print(countModel.count);
    notifyListeners();
  }

  void decrease() {
    countModel.count--;
    notifyListeners();
  }
}
