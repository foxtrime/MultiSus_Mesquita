import 'package:multisus_mesquita/pdf_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PdfApi {
  static Future<List<Pdf>> getPdfs() async {
    var url = 'http://tecnologia360.mesquita.rj.gov.br/pdf';

    print("GET > $url");

    var response = await http.get(url);

    List list = json.decode(response.body);
    
    print(list);

    
    final pdfs = list.map<Pdf>((map) => Pdf.fromJson(map)).toList();

 
    return pdfs;

  }
}