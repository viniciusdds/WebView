import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:get/get.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:get_ip/get_ip.dart';
import 'package:webview/repository/web_repository.dart';

class WebController extends GetxController{

  FlutterWebviewPlugin flutterWebViewPlugin = FlutterWebviewPlugin();
  String ip = "";
  var result;

  Future<void> initPlatformState() async {
    String ipAddress;
    try {
      ipAddress = await GetIp.ipAddress;
    } on PlatformException {
      ipAddress = 'Failed to get ipAddress.';
    }

    //if (!mounted) return;

      ip = ipAddress;
  }

  Future<dynamic> capturar(String valor, String ipAddress) async {

    result = await WebRepository.capturar(valor, ipAddress);

    //print(result);

  }

}