import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
part 'screen_write_controller.g.dart';

class ScreenWriteController = _ScreenWriteControllerBase
    with _$ScreenWriteController;

abstract class _ScreenWriteControllerBase with Store {
  @action
  savePost(String text) async {
    Firestore db = Firestore.instance;

    await db.collection("Users").add(
      {
        "name": "User",
        "message": text,
        "date": DateTime.now(),
      },
    );
    text = "";
  }
}
