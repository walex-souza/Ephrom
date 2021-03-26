class Talk {
  String _name;
  String _message;
  String _image;
  DateTime _dateTime;

  Talk();

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "name": this._name,
      "message": this._message,
      "image": this._image,
      "date": this._dateTime
    };
    return map;
  }

  String get name => this._name;

  set name(String value) => this._name = value;

  String get message => this._message;

  set message(String value) => this._message = value;

  String get image => this._image;

  set image(String value) => this._image = value;

  DateTime get dateTime => this._dateTime;

  set dateTime(DateTime value) => this._dateTime = value;
}
