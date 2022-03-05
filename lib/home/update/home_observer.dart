import 'package:flutter_observer_pattern_demo/home/model/home_bean.dart';

abstract class HomeObserver {
  void onSubscribe();

  void onUpdate(List<HomeBean> list);
}
