class Pdf {
  String id;
  String titulo;
  String descricao;
  String urlPdf;
  String iconUrl;

  Pdf({this.id, this.titulo, this.descricao, this.urlPdf, this.iconUrl});

  Pdf.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['titulo'];
    descricao = json['descricao'];
    urlPdf = json['urlPdf'];
    iconUrl = json['iconUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['titulo'] = this.titulo;
    data['descricao'] = this.descricao;
    data['urlPdf'] = this.urlPdf;
    data['iconUrl'] = this.iconUrl;
    
    return data;
  }
}