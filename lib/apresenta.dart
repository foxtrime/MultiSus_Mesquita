import 'package:flutter/material.dart';
import 'index.dart';

class Apresenta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _irInicio(context),
    );
  }

  Widget _irInicio(context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          SizedBox(height: 150),
          Text(
              "O Aplicativo MULTISUS MESQUITA, é um projeto desenvolvido pela Equipe da Resisdência Multiprofissonal em Saúde da Familia da ENSP/FIOCRUZ em parceria com o Município de Mesquita. E tem como objetivo divulgar e compartilhar materiais de educação em saúdee através de informações seguras e de fácil acesso para os trabalhadores e a população no contexto do cenário atual da Pandemia: COVID-19(SAR-CoV-2)."),
          SizedBox(height: 170),
          Container(
            child: FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Index()),
                );
              },
              label: Text('Continuar'),
              icon: Icon(Icons.thumb_up),
              backgroundColor: Color(0xFF3E276A),
            ),
            alignment: Alignment.bottomRight,
            margin: EdgeInsets.all(20),
          ),
        ],
      ),
    );
  }
}
