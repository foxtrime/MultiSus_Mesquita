import 'package:flutter/material.dart';
import 'package:multisus_mesquita/pdf_api.dart';
import 'package:multisus_mesquita/pdf_model.dart';
import 'package:url_launcher/url_launcher.dart';

class Index extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MultiSuS Mesquita'),
        backgroundColor: Color(0xFF3E276A),
      ),
      body: _viewPdf(),
    );
  }

  _viewPdf() {
    Future<List<Pdf>> pdfs = PdfApi.getPdfs();

    return FutureBuilder(
      future: pdfs,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
          return Center(
            child: Text("Não foi possivel retornar os pdf's"),
          );
        }

        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        List<Pdf> pdfs = snapshot.data;
        return _listView(pdfs);
      },
    );
  }

  _listView(List<Pdf> pdfs) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 0.0,
          mainAxisSpacing: 0.0,
        ),
        itemCount: pdfs != null ? pdfs.length : 0,
        itemBuilder: (context, index) {
          Pdf p = pdfs[index];

          return Container(
            padding: EdgeInsets.all(5.0),
            child: Card(
                child: InkWell(
              onTap: () async {
                var url = p.urlPdf;
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Cold not lauch $url';
                }
              },
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(0,13,0,10),
                      child: Image.network(p.iconUrl),
                    ),
                    
                    Text(
                      p.titulo,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ),
            )),
          );
        });
  }
}

//https://br.freepik.com/search?dates=any&format=search&page=1&query=washing%20hands&selection=1&sort=popular&type=icon
