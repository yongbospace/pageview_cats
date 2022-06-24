import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController controller = PageController(initialPage: 0);
  Timer? timer;

  @override
  void initState() {
    // TODO: implement initState
    timer = Timer.periodic(Duration(seconds: 2), (timer) {
      int currentPage = controller.page!.toInt();
      int nextPage = currentPage + 1;
      controller.animateToPage(nextPage < 5 ? nextPage : 1,
          duration: Duration(milliseconds: 300), curve: Curves.linear);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        children: [1, 2, 3, 4, 5]
            .map(
              (number) => Image.asset(
                'asset/img/$number.jpeg',
                fit: BoxFit.cover,
              ),
            )
            .toList(),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    if (timer != null) {
      timer!.cancel();
    }
    controller.dispose();
    super.dispose();
  }
}
