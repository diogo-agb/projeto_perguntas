import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
    print(_perguntaSelecionada);
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        'Preto',
        'Vermelho',
        'Verde',
        'Branco',
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        'Coelho',
        'Cobra',
        'Elefante',
        'Leão',
      ],
    },
    {
      'texto': 'Qual o seu instrutor favorito',
      'respostas': [
        'Maria',
        'Nat',
        'Léo',
        'Pedro',
      ],
    }
  ];

  @override
  Widget build(BuildContext context) {
    List<String> respostas = temPerguntaSelecionada
        ? _perguntas[_perguntaSelecionada]['respostas']
        : null;

    List<Widget> widgets =
        respostas.map((t) => Resposta(t, _responder)).toList();

    // for (String textoResp in respostas) {
    //   widgets.add(Resposta(textoResp, _responder));
    //   print(textoResp);
    // }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Perguntas",
          ),
        ),
        body: temPerguntaSelecionada
            ? Column(
                children: <Widget>[
                  Questao(_perguntas[_perguntaSelecionada]['texto']),
                  ...widgets,
                ],
              )
            : null,
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
