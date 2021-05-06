import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class WebApi{

  static final URL = 'http://clients.eadiaurora.com.br:8469/gerencia/MyCMS/conferencia/webView.php';

  static Future capturar(String valor, String ipAddress) async {

    var client = http.Client();

    try{

      var response = await client.get(URL+"?action=capturar"
        "&valor=$valor"
        "&ipAddress=$ipAddress"
      );

      var resp = response.body;

      return resp;

    }catch(e){
      Get.snackbar("Erro ao Conectar", "Não foi possível acessar o servidor $e", duration: Duration(seconds: 2));
    }finally{
      client.close();
    }

  }

}