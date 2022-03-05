import 'package:flutter_observer_pattern_demo/home/model/home_bean.dart';
import 'package:flutter_observer_pattern_demo/home/model/home_model.dart';
import 'package:flutter_observer_pattern_demo/home/update/home_observable.dart';
import 'package:flutter_observer_pattern_demo/home/update/home_observer.dart';

class HomeController {
  HomeObservable observable = HomeObservable();

  HomeController() {
    final HomeModel model = HomeModel();
    Future.delayed(const Duration(milliseconds: 3000), () {
      final List<HomeBean> list = model.getList();
      update(list);
    });
  }

  void subscribe(HomeObserver observer) {
    observable.subscribe(observer);
  }

  void unsubscribe() {
    observable.unsubscribe();
  }

  void update(List<HomeBean> list) {
    observable.update(list);
  }
}
