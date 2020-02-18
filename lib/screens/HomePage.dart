import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  final flutterWebviewPlugin = new FlutterWebviewPlugin();

  @override
  void initState() {
    super.initState();
    flutterWebviewPlugin.close();
  }

  @override
  void dispose() {

    flutterWebviewPlugin.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
          margin: const EdgeInsets.only(top: 0.0),
          child: SafeArea(
          top: true,
          child: WebviewScaffold(
      url: 'https://apps.brownbearsw.com/iobee/jamanv/login',
      withJavascript: true,
    // headers: {'Authorization': 'Basic $username:$password'}
    )));
  }

}
