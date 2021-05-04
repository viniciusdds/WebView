import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class WebPage extends StatefulWidget {
  String title;
  String url;
  var userAgent;

  WebPage(this.title, this.url, this.userAgent);
  @override
  _WebPageState createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {

  FlutterWebviewPlugin flutterWebViewPlugin = FlutterWebviewPlugin();
  String data = "";

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

    return  WebviewScaffold(
          resizeToAvoidBottomInset: true,
          url: widget.url,
          // javascriptChannels: jsChannels,
          mediaPlaybackRequiresUserGesture: false,
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Text(
                    widget.title,
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                ),

                 IconButton(
                      icon: Icon(Icons.qr_code_sharp, size: 30),
                      onPressed: () async {

                        await Permission.camera.request();
                        String barcode = await scanner.scan();
                        if (barcode == null) {
                          print('nothing return.');
                        } else {
                           print("resultado: "+barcode);
                        }

                         // try{
                         //
                         //   String cameraScanResult = await scanner.scan();
                         //   setState(() {
                         //     data = cameraScanResult;
                         //     print("resultado: "+data);
                         //   });
                         //
                         // }catch(e){
                         //   print(e);
                         // }


                      }
                  ),

              ],
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




