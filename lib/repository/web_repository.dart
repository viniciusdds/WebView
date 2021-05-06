
import 'package:webview/util/web_api.dart';

class WebRepository{

  static Future<dynamic> capturar(String valor, String ipAddress) async {

    var result = await WebApi.capturar(valor, ipAddress);

    return result;

  }

}