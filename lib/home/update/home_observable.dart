import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_observer_pattern_demo/home/model/home_bean.dart';
import 'package:flutter_observer_pattern_demo/home/update/home_observer.dart';

class HomeObservable {
  @protected
  final StreamController<List<HomeBean>> stockStreamController =
      StreamController();

  Stream<List<HomeBean>> get stockStream => stockStreamController.stream;

  late HomeObserver? _observer;

  void update(List<HomeBean> stock) {
    stockStreamController.add(stock);
  }

  void subscribe(HomeObserver observer) {
    _observer = observer;
    _observer?.onSubscribe();
    stockStream.listen((list) {
      _observer?.onUpdate(list);
    });
  }

  void unsubscribe() {
    _observer = null;
  }
}
