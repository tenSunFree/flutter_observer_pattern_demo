import 'package:flutter/material.dart';
import 'package:flutter_observer_pattern_demo/home/model/home_bean.dart';
import 'package:flutter_observer_pattern_demo/home/update/home_controller.dart';
import 'package:flutter_observer_pattern_demo/home/update/home_observer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> implements HomeObserver {
  late List<HomeBean> _list;
  late HomeController _controller;

  @override
  void initState() {
    super.initState();
    _list = [];
    _controller = HomeController();
    _controller.subscribe(this);
  }

  @override
  Widget build(BuildContext context) {
    bool isEmpty = _list.isEmpty;
    return Scaffold(
      body: Container(
        color: const Color(0xFFEAEAEA),
        child: Column(
          children: [
            const Image(image: AssetImage('assets/icon_top.png')),
            if (isEmpty)
              const Expanded(child: Center(child: CircularProgressIndicator()))
            else
              buildGridViewExpanded(),
            const Image(image: AssetImage('assets/icon_bottom.png')),
          ],
        ),
      ),
    );
  }

  Expanded buildGridViewExpanded() {
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.6),
        itemCount: _list.length,
        itemBuilder: (context, index) {
          bool isRight = (index + 2) % 2 != 0;
          return buildGridViewItemContainer(isRight, index);
        },
      ),
    );
  }

  Container buildGridViewItemContainer(bool isRight, int index) {
    return Container(
      margin: EdgeInsets.only(left: isRight ? 8 : 0, bottom: 8),
      decoration: const ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.all(Radius.circular(16)))),
      child: Column(
        children: [
          Container(
              decoration: ShapeDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: NetworkImage('${_list[index].imageUrl}'),
                      fit: BoxFit.fill),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.only(
                          topStart: Radius.circular(16),
                          topEnd: Radius.circular(16)))),
              width: double.maxFinite,
              height: 220),
          const Spacer(),
          Text(_list[index].title ?? '',
              style: const TextStyle(fontSize: 16, color: Color(0xFF393939))),
          const Spacer(),
        ],
      ),
    );
  }

  @override
  void onSubscribe() {
    bool isEmpty = _list.isEmpty;
    isEmpty
        ? const SizedBox()
        : ListView.builder(
            itemCount: _list.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: const Icon(Icons.event_seat),
                title: Text('${_list[index].title}'),
                subtitle: Text('${_list[index].imageUrl}'),
              );
            },
          );
  }

  @override
  void onUpdate(List<HomeBean> list) {
    setState(() => _list = list);
  }

  @override
  void dispose() {
    _controller.unsubscribe();
    super.dispose();
  }
}
