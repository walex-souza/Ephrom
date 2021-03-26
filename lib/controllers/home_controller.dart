import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
import 'package:teste_ephrom/models/GetUser.model.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @action
  Future<List<Talk>> getUsers() async {
    Firestore db = Firestore.instance;

    QuerySnapshot querySnapshot = await db
        .collection("Users")
        .orderBy("date", descending: false)
        .getDocuments();

    List<Talk> listUsers = List();

    for (DocumentSnapshot item in querySnapshot.documents) {
      var data = item.data;

      Talk talkUser = Talk();
      talkUser.name = data["name"];
      talkUser.message = data["message"];
      talkUser.dateTime = data["date"].toDate();

      listUsers.add(talkUser);
    }
    return listUsers;
  }
}
