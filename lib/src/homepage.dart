import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/pages/my_page_view.dart';
import 'package:flutter_application_1/src/sample_articles.dart';
import 'package:flutter_application_1/src/sample_pages.dart';
import 'package:flutter_application_1/src/webview.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _body(),
      floatingActionButton: _floatingActionButtonWebView(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawer: _drawer(context),
      bottomNavigationBar: _bottombar(),
    );
  }

  AppBar _appBar(BuildContext context) {
    Widget buildIconButton(
      BuildContext context,
      IconData icon,
      String currentErrorMessage,
    ) =>
        IconButton(
          onPressed: () => _showSnackbarMessage(context, currentErrorMessage),
          icon: Icon(icon),
        );

    return AppBar(
      title: const Text("My title"),
      actions: [
        buildIconButton(context, Icons.search, "Search not available atm..."),
        buildIconButton(
            context, Icons.settings, "Settings not available atm..."),
      ],
    );
  }

  Widget _body() {
    return const SampleArticles();
  }

  Widget _floatingActionButtonWebView(BuildContext context) {
    return FloatingActionButton.extended(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
      onPressed: () {
        //_showSnackbarMessage(context, "WebView not available atm...");
        Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WebView()),
                );
      },
      tooltip: "Open Webview",
      isExtended: true,
      label: const Text("Open Webview"),
      icon: const Icon(Icons.web),
    );
  }

  Widget _drawer(BuildContext context) {
    Widget drawerHeader = DrawerHeader(
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary),
      child: const Text("Samples pages",
          style: TextStyle(fontSize: 32, color: Colors.white)),
    );
    return Drawer(
      child: ListView(
        children: [
          drawerHeader,
          for (final p in samplePages)
            ListTile(
              leading: const Icon(Icons.arrow_forward),
              title: Text(p.title),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyPageView(page: p)),
                );
              },
            ),
        ],
      ),
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
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
      ),
      child: SizedBox(height: 55.0),
    );
  }

  void _showSnackbarMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..clearMaterialBanners()
      ..showSnackBar(SnackBar(
        backgroundColor: Colors.lightGreen,
        behavior: SnackBarBehavior.floating,
        showCloseIcon: true,
        elevation: 5,
        content: Text(message),
      ));

    return;
  }
}
