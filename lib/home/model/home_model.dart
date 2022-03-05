import 'package:flutter_observer_pattern_demo/home/model/home_bean.dart';

class HomeModel {
  List<HomeBean> getList() {
    final List<HomeBean> list = [];
    list.add(HomeBean(
        title: '美國大峽谷',
        imageUrl:
            'http://www.caneis.com.tw/link/world/world.files/Img221806932.jpg'));
    list.add(HomeBean(
        title: '澳大利亞的大堡礁',
        imageUrl:
            'http://www.caneis.com.tw/link/world/world.files/Img221806933.jpg'));
    list.add(HomeBean(
        title: '美國佛羅里達州',
        imageUrl:
            'http://www.caneis.com.tw/link/world/world.files/Img221806983.jpg'));
    list.add(HomeBean(
        title: '紐西蘭的南島',
        imageUrl:
            'http://www.caneis.com.tw/link/world/world.files/Img221806934.jpg'));
    list.add(HomeBean(
        title: '好望角',
        imageUrl:
            'http://www.caneis.com.tw/link/world/world.files/Img221806935.jpg'));
    list.add(HomeBean(
        title: '金廟',
        imageUrl:
            'http://www.caneis.com.tw/link/world/world.files/Img221806936.jpg'));
    list.add(HomeBean(
        title: '拉斯維加斯',
        imageUrl:
            'http://www.caneis.com.tw/link/world/world.files/Img221806937.jpg'));
    list.add(HomeBean(
        title: '印度泰姬陵',
        imageUrl:
            'http://www.caneis.com.tw/link/world/world.files/Img221806942.jpg'));
    list.add(HomeBean(
        title: '加拿大洛基山脈',
        imageUrl:
            'http://www.caneis.com.tw/link/world/world2.files/Img221806943.jpg'));
    list.add(HomeBean(
        title: '澳州艾爾斯山',
        imageUrl:
            'http://www.caneis.com.tw/link/world/world2.files/Img221806944.jpg'));
    return list;
  }
}
