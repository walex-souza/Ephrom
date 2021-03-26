class User {
  String iD;
  String codigo;
  int respostas;
  String dataHora;
  bool estaLido;
  String autorID;
  String autorNome;
  String autorImageUrl;
  String texto;
  int versao;

  User(
      {this.iD,
      this.codigo,
      this.respostas,
      this.dataHora,
      this.estaLido,
      this.autorID,
      this.autorNome,
      this.autorImageUrl,
      this.texto,
      this.versao});

  User.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    codigo = json['Codigo'];
    respostas = json['Respostas'];
    dataHora = json['DataHora'];
    estaLido = json['EstaLido'];
    autorID = json['AutorID'];
    autorNome = json['AutorNome'];
    autorImageUrl = json['AutorImageUrl'];
    texto = json['Texto'];
    versao = json['Versao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['Codigo'] = this.codigo;
    data['Respostas'] = this.respostas;
    data['DataHora'] = this.dataHora;
    data['EstaLido'] = this.estaLido;
    data['AutorID'] = this.autorID;
    data['AutorNome'] = this.autorNome;
    data['AutorImageUrl'] = this.autorImageUrl;
    data['Texto'] = this.texto;
    data['Versao'] = this.versao;
    return data;
  }
}
