import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview/screen/web_page.dart';

class Home extends StatefulWidget {

  var userAgent;

  Home({this.userAgent});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height * 1000,
        padding: EdgeInsets.only(top: 50, right: 16, left: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.only(bottom: 30, top: 20),
                  child: Text(
                      "Escolha uma das opções abaixo",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold
                      ),
                  ),
              ),
              GestureDetector(
                child: Card(
                  elevation: 2.5,
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade100),
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      color: Colors.white70,
                    ),
                    child: Container(
                      color: Colors.orange,
                      padding: EdgeInsets.all(6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.arrow_back, color: Colors.white70),
                          Text("Check List - Coleta",
                            style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                onTap: (){
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => WebPage(
                          "Check List - Coleta",
                          "https://clients.eadiaurora.com.br/check_list_carga/principal.php",
                           widget.userAgent,
                           1
                        )
                      )
                    );
                },
              ),
              SizedBox(
                height: 40,
              ),
              GestureDetector(
                child: Card(
                  elevation: 2.5,
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade100),
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      color: Colors.white70,
                    ),
                    child: Container(
                      color: Colors.orange,
                      padding: EdgeInsets.all(6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.arrow_forward, color: Colors.white70),
                          Text("Check List - Entrada",
                            style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                onTap: (){
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => WebPage(
                          "CHECK LIST - ENTRADA",
                          "https://clients.eadiaurora.com.br/check_list/principal.php",
                          widget.userAgent,
                          2
                      ))
                  );
                },
              ),
              SizedBox(
                height: 40,
              ),
              GestureDetector(
                child: Card(
                  elevation: 2.5,
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade100),
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      color: Colors.white70,
                    ),
                    child: Container(
                      color: Colors.orange,
                      padding: EdgeInsets.all(6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.airport_shuttle_outlined, color: Colors.white70),
                          Text("Transportes",
                            style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                onTap: (){
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) =>WebPage(
                          "AURORA EADI | SOROCABA",
                          "https://clients.eadiaurora.com.br/mobile/principal.php",
                          widget.userAgent,
                          3
                      ))
                  );
                },
              ),
              SizedBox(
                height: 40,
              ),
              GestureDetector(
                child: Card(
                  elevation: 2.5,
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color:  Colors.grey.shade100),
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      color: Colors.white70,
                    ),
                    child: Container(
                      color: Colors.orange,
                      padding: EdgeInsets.all(6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.photo_camera, color: Colors.white70),
                          Text("Fotos Operacionais",
                            style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                onTap: (){
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) =>WebPage(
                          "FOTOS DE CARGA",
                          "http://172.20.220.126:4050/gerencia/MyCMS/conferencia/",
                          widget.userAgent,
                          4
                      ))
                  );
                },
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(top: 80),
                child: Text(
                    "v2.0",
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        )
      ),
    );
  }
}
