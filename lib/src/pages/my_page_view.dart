import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/pages/mypage.dart';

class MyPageView extends StatelessWidget {
  const MyPageView({super.key, required this.page});

  final MyPage page;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(page),
      body: _body(page),
      floatingActionButton: _floatingActionButton(context),
      bottomNavigationBar: _bottombar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  AppBar _appBar(MyPage page) {
    return AppBar(
      title: Text(page.title),
    );
  }

  Widget _body(MyPage page) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: Center(
        child: Text(page.content),
      ),
    );
  }

  Widget _floatingActionButton(context) {
    return FloatingActionButton.extended(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
      onPressed: () {
        ScaffoldMessenger.of(context)
          ..clearSnackBars()
          ..showSnackBar(
            const SnackBar(
              backgroundColor: Colors.lightGreen,
              behavior: SnackBarBehavior.floating,
              elevation: 5.0,
              margin: EdgeInsets.fromLTRB(40, 10, 40, 10),
              showCloseIcon: true,
              content: Text('Hello, World!'),
            ),
          );

        // Navigator.pop(context);
      },
      tooltip: "Speak",
      isExtended: true,
      // child: Icon(Icons.ads_click),
      label: const Text("Speak"),
      icon: const Icon(Icons.south_america),
    );
  }

  Widget _bottombar() {
    return const BottomAppBar(
      notchMargin: 20.0,
      shape: AutomaticNotchedShape(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
        ),
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(200)),
        ),
      ),
      child: SizedBox(height: 55.0),
    );
  }
}
