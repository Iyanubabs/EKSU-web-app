import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eksu App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late WebViewController _controller;
  _goBack() async {
    if (await _controller.canGoBack()) {
      _controller.goBack;
    }
  }

  _goForward() async {
    if (await _controller.canGoForward()) {
      _controller.goForward;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Eksu Portal App'),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: _goBack,
          ),
          IconButton(
            icon: Icon(
              Icons.arrow_forward,
            ),
            onPressed: _goForward,
          )
        ],
      ),
      body: SafeArea(
        child: WebView(
            initialUrl: 'https://eksuportal.eksu.edu.ng',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webviewcontroller) {
              _controller = webviewcontroller;
            }),
      ),
    );
  }
}
