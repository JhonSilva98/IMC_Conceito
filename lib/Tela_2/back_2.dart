import 'package:flutter/material.dart';
import 'package:imc_conceito/Tela_2/informacoes.dart';

class back2 extends Iformacoes {
  bool colorButton = true;
  int positionIndicator = 0;
  double resultadoFinal = 0;
  double altura = 0;
  Widget iconEmoji = const Icon(Icons.info);
  double controllerHeight = 0;
  double controllerWeight = 0;
  String textoFinal = "test";

  Widget icon() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Image.asset(
        'assets/dashboardMod.png',
        height: 200,
      ),
    );
  }

  void calcular() {
    //setState
    altura = controllerHeight;
    resultadoFinal = controllerWeight / (controllerHeight * controllerHeight);
  }

  Widget getWidgetIcon() {
    //setState
    switch (resultadoFinal) {
      case > 0 && < 18.5:
        textoFinal = info[1];
        iconEmoji = const Icon(
          Icons.sentiment_neutral_outlined,
          color: Color.fromARGB(180, 158, 158, 158),
          size: 50,
        );
        break;
      case > 18.6 && < 24.9:
        textoFinal = info[2];
        iconEmoji = const Icon(
          Icons.emoji_emotions_outlined,
          color: Color.fromARGB(193, 76, 175, 79),
          size: 50,
        );
        break;
      case > 25 && < 29.9:
        textoFinal = info[3];
        iconEmoji = const Icon(
          Icons.sentiment_dissatisfied,
          color: Color.fromARGB(188, 255, 235, 59),
          size: 50,
        );
        break;
      case > 30 && < 34.9:
        textoFinal = info[4];
        iconEmoji = const Icon(
          Icons.sentiment_dissatisfied_outlined,
          color: Color.fromARGB(181, 255, 153, 0),
          size: 50,
        );
        break;
      case > 35 && < 39.9:
        textoFinal = info[4];
        iconEmoji = const Icon(
          Icons.sentiment_very_dissatisfied_outlined,
          color: Color.fromARGB(184, 244, 67, 54),
          size: 50,
        );
        break;
      default:
        textoFinal = info[4];
        iconEmoji = const Icon(
          Icons.sentiment_very_dissatisfied_outlined,
          color: Color.fromARGB(181, 151, 12, 2),
          size: 50,
        );
        break;
      // Retorna um Container vazio caso nenhum caso seja correspondido
    }
    return iconEmoji;
  }

  void floatInformacoes(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            icon: const Icon(Icons.info_outline_rounded),
            backgroundColor: Colors.white,
            title: const Text('Informações'),
            content: const Text(
                'É importante lembrar que o IMC é apenas uma medida geral e não leva em consideração outros fatores, como a composição corporal e a distribuição de gordura. É sempre recomendado consultar um profissional de saúde para uma avaliação mais precisa e individualizada.'),
            actions: <Widget>[
              TextButton(
                child: const Text('Fechar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
