import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:network_info_plus/network_info_plus.dart';

import 'package:path_provider/path_provider.dart';
import 'package:webview/repository/web_repository.dart';

class WebController extends GetxController{

  FlutterWebviewPlugin flutterWebViewPlugin = FlutterWebviewPlugin();
  String ip = "";
  var result;
  var scanArea = (Get.width < 400 || Get.height < 400) ? 150.0 : 300.0;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  final info = NetworkInfo();

  Future<void> initPlatformState() async {
    var ipAddress;

    try {
      ipAddress = await info.getWifiIP();
    } on PlatformException {
      ipAddress = 'Failed to get ipAddress.';
    }

    //if (!mounted) return;

    ip = ipAddress;
  }

  Future<dynamic> capturar(String valor, String ipAddress) async {

    result = await WebRepository.capturar(valor, ipAddress);

    print(result);

  }

  //Função para apagar o diretorio Files do App
  void clearCache() async {
    // List<Directory> appDocDir = await getExternalCacheDirectories();
    //List<Directory> appDocDir2 = await getExternalStorageDirectories();
   Directory? dir = (await getExternalStorageDirectory());

    final rev = Directory(dir!.path);
    rev.deleteSync(recursive: true);
    print(dir);
  }

}