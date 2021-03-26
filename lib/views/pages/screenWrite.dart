import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:teste_ephrom/controllers/home_controller.dart';
import 'package:teste_ephrom/controllers/screen_write_controller.dart';
import 'package:teste_ephrom/views/home.dart';

class ScreenWrite extends StatefulWidget {
  @override
  _ScreenWriteState createState() => _ScreenWriteState();
}

class _ScreenWriteState extends State<ScreenWrite> {
  ScreenWriteController _controller = ScreenWriteController();
  TextEditingController _textEditingController = TextEditingController();
  String text;

  HomeController _homeController;

  @override
  Widget build(BuildContext context) {
    Home();
    // _controller.textController;
    return Scaffold(
      backgroundColor: Color(0xff211F4C),
      appBar: AppBar(
        backgroundColor: Color(0xff211F4C),
        title: Text("Escreva oque está pensando..."),
      ),
      body: Container(
        margin: EdgeInsets.all(30),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Material(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xff222D75),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      controller: _textEditingController,
                      cursorColor: Colors.white,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      maxLines: 5,
                      maxLength: 380,
                      decoration: InputDecoration(
                        counterStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xff222D75),
                  ),
                  child: InkWell(
                    child: IconButton(
                      iconSize: 60,
                      icon: Observer(builder: (_) {
                        return Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.white,
                        );
                      }),
                      onPressed: () {
                        text = _textEditingController.text;
                        _controller.savePost(text);
                        _textEditingController.clear();
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Home()));
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
