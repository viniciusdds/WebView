import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:get/get.dart';

class WebPage extends StatefulWidget {
  String title;
  String url;
  var userAgent;

  WebPage(this.title, this.url, this.userAgent);
  @override
  _WebPageState createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {

  final flutterWebViewPlugin = FlutterWebviewPlugin();



  @override
  void initState() {
    super.initState();

    flutterWebViewPlugin.close();
  }

  @override
  void dispose() {
    super.dispose();

    flutterWebViewPlugin.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return WebviewScaffold(
        resizeToAvoidBottomInset: true,
        url: widget.url,
        // javascriptChannels: jsChannels,
        mediaPlaybackRequiresUserGesture: false,
        appBar: AppBar(
          title: Text(
            widget.title,
            style: TextStyle(fontSize: 15),
          ),
        ),
        withZoom: false,
        withLocalStorage: true,
        hidden: true,
        userAgent: widget.userAgent,
        initialChild: Container(
          padding: EdgeInsets.only(top: 300),
          height: Get.height,
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 mainAxisSize: MainAxisSize.max,
                 children: [
                     CircularProgressIndicator(
                       backgroundColor: Colors.lightBlue,
                     ),
                     Text("Aguarde...", style: TextStyle(color: Colors.lightBlue))
                 ],
              ),
            ),
          ),
        ),
    );
  }
}




