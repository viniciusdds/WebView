import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';


import 'package:get/get.dart';
import 'package:webview/controller/web_controller.dart';
import 'package:webview/screen/home_page.dart';
import 'package:path_provider/path_provider.dart';

const kAndroidUserAgent =
    'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Mobile Safari/537.36';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  clearCache();

  Get.put(WebController());
  runApp(MyApp());
}

//Função para apagar o diretorio Files do App
void clearCache() async {
  // List<Directory> appDocDir = await getExternalCacheDirectories();
  //List<Directory> appDocDir2 = await getExternalStorageDirectories();
  Directory? dir = (await getExternalStorageDirectory());

  final rev = Directory(dir!.path);
  rev.deleteSync(recursive: true);
  //print(dir);

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(userAgent: kAndroidUserAgent),
    );
  }
}