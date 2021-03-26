import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:teste_ephrom/controllers/home_controller.dart';
import 'package:teste_ephrom/models/GetUser.model.dart';
import 'package:teste_ephrom/models/User.model.dart';
import 'package:teste_ephrom/views/pages/screenWrite.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String urlBase = "https://api.mocki.io/v1/f932124c/posts";

  HomeController _homeController = HomeController();

  Future<List<User>> _getPosts() async {
    http.Response response = await http.get(urlBase);
    var dadosJson = jsonDecode(response.body);

    // print(dadosJson);
    List<User> listPosts = List();
    for (var post in dadosJson["Result"]) {
      print("Post: " + post["AutorNome"]);
      User users = User(
        autorID: post["AutorID"],
        autorImageUrl: post["AutorImageUrl"],
        autorNome: post["AutorNome"],
        codigo: post["Codigo"],
        dataHora: post["DataHora"],
        estaLido: post["EstaLido"],
        iD: post["ID"],
        respostas: post["Respostas"],
        texto: post["Texto"],
        versao: post["Versao"],
      );
      listPosts.add(users);
    }
    return listPosts;
  }

  List<User> userList = [
    User(
      autorID: "1",
      autorImageUrl: "",
      autorNome: "Walex",
      codigo: "1",
      dataHora: "10",
      estaLido: true,
      iD: "1",
      respostas: 1,
      texto: "Olá",
      versao: 1,
    )
  ];

  @override
  void initState() {
    super.initState();
    _homeController.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff211F4C),
      appBar: AppBar(
        backgroundColor: Color(0xff211F4C),
        title: Text(
          "ephrom",
          style: TextStyle(fontSize: 23, color: Colors.grey[400]),
        ),
        centerTitle: true,
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              Icons.search,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            FutureBuilder<List<User>>(
              future: _getPosts(),
              builder: (context, snapshot) {
                String result;
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    print("conexão none");
                    break;
                  case ConnectionState.waiting:
                    return Center(
                      child: CircularProgressIndicator(),
                    );

                    break;

                  case ConnectionState.active:

                  case ConnectionState.done:
                    print("conexão done");
                    if (snapshot.hasError) {
                      result = "Erro ao carregar os dados!";
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          List<User> listPosts = snapshot.data;
                          User users = listPosts[index];
                          return ListTile(
                            contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                            leading: CircleAvatar(
                              maxRadius: 30,
                              backgroundColor: Colors.grey,
                              backgroundImage:
                                  NetworkImage(users.autorImageUrl),
                            ),
                            title: Row(
                              children: [
                                Text(
                                  users.autorNome,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  users.dataHora,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                )
                              ],
                            ),
                            subtitle: Material(
                                color: Color(0xff222D75),
                                elevation: 4,
                                borderRadius: BorderRadius.circular(10),
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    users.texto,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                )),
                          );
                        },
                      );
                    }
                    break;
                }
                return Center(
                  child: Text(result),
                );
              },
            ),
            FutureBuilder<List<Talk>>(
              future: _homeController.getUsers(),
              builder: (context, snapshot) {
                String result;
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    print("conexão none");
                    break;
                  case ConnectionState.waiting:
                    return Center(
                      child: CircularProgressIndicator(),
                    );

                    break;

                  case ConnectionState.active:

                  case ConnectionState.done:
                    print("conexão done");
                    if (snapshot.hasError) {
                      result = "Erro ao carregar os dados!";
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          List<Talk> listPosts = snapshot.data;
                          Talk users = listPosts[index];
                          return ListTile(
                            contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                            leading: CircleAvatar(
                              maxRadius: 30,
                              backgroundColor: Colors.grey,
                              backgroundImage: NetworkImage(
                                  "https://www.pavilionweb.com/wp-content/uploads/2017/03/man-300x300.png"),
                            ),
                            title: Row(
                              children: [
                                Text(
                                  users.name,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  users.dateTime.toString(),
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                )
                              ],
                            ),
                            subtitle: Material(
                                color: Color(0xff222D75),
                                elevation: 4,
                                borderRadius: BorderRadius.circular(10),
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    users.message,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                )),
                          );
                        },
                      );
                    }
                    break;
                }
                return Center(
                  child: Text(result),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          color: Colors.white,
        ),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ScreenWrite(),
              ),
            );
          },
          backgroundColor: Color(0xff222D75),
          foregroundColor: Colors.white,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
