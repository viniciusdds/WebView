import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:webview/controller/web_controller.dart';
import 'package:webview/screen/home_page.dart';


class WebPage extends StatefulWidget {
  String title;
  String url;
  var userAgent;
  int tela;

  WebPage(this.title, this.url, this.userAgent, this.tela);
  @override
  _WebPageState createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {

  WebController webController = Get.find();

  @override
  void initState() {
    super.initState();

    webController.initPlatformState();
    webController.flutterWebViewPlugin.close();
  }

  @override
  void dispose() {
    super.dispose();

    webController.flutterWebViewPlugin.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return  WebviewScaffold(
          resizeToAvoidBottomInset: true,
          url: widget.url,
          // javascriptChannels: jsChannels,
          mediaPlaybackRequiresUserGesture: false,
          appBar: AppBar(
            title:
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      icon: Icon(Icons.home, size: 30),
                      onPressed: (){
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Home(
                            userAgent: widget.userAgent,
                          ))
                        );
                      }
                  ),
                  Expanded(
                    child: Text(
                      widget.title,
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  widget.tela == 4 ? IconButton(
                        icon: Icon(Icons.qr_code_sharp, size: 30),
                        onPressed: () async {

                          await Permission.camera.request();
                          String barcode = await scanner.scan();
                          if (barcode == null) {
                            print('Nada Retornado!');
                          } else {
                               setState(() {
                                 //print("Valor: "+barcode);
                                 //print("IP: "+webController.ip);
                                 webController.capturar(
                                   barcode,
                                   webController.ip
                                 );
                               });
                          }
                        }
                    ) : SizedBox(),
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




