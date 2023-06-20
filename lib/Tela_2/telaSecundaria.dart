import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imc_conceito/Tela_3-Resultados/telafinal.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart'
    as indicator;
import 'back_2.dart';

class EnterData extends StatefulWidget {
  const EnterData({super.key});

  @override
  State<EnterData> createState() => _EnterDataState();
}

class _EnterDataState extends State<EnterData> {
  PageController pageController = PageController();
  TextEditingController controllerWeight = TextEditingController();
  TextEditingController controllerHeight = TextEditingController();

  var extBack2 = back2();

  void calcular() {
    extBack2.controllerHeight = double.parse(controllerHeight.text);
    extBack2.controllerWeight = double.parse(controllerWeight.text);
    setState(() {
      extBack2.calcular();
    });
  }

  Widget getWidgetIcon() {
    setState(() {
      extBack2.iconEmoji = extBack2.getWidgetIcon();
    });
    return extBack2.iconEmoji;
  }

  void verificadorTransicao() {
    int positionPag = extBack2.positionIndicator;
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    setState(() {
      switch (extBack2.positionIndicator) {
        case 0:
          if (controllerWeight.text.isNotEmpty) {
            positionPag <= 2 ? positionPag++ : null;
            pageController.animateToPage(
              positionPag,
              duration: const Duration(milliseconds: 500),
              curve: Curves.ease,
            );
          } else {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: Colors.white,
                    title: const Text('Falha ao enviar.'),
                    content: const Text('Favor insira os dados no campo!'),
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
          break;
        case 1:
          if (controllerHeight.text.isNotEmpty &&
              double.parse(controllerHeight.text) <= 5) {
            calcular();
            switch (extBack2.resultadoFinal) {
              case <= 100:
                positionPag <= 2 ? positionPag++ : null;
                pageController.animateToPage(
                  positionPag,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
                break;
              default:
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Colors.white,
                        title: const Text('Falha ao enviar.'),
                        content: const Text(
                            'Favor verificar os dados digitados, IMC dando acima de 100.'),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Fechar'),
                            onPressed: () {
                              Navigator.popUntil(
                                  context, (route) => route.isFirst);
                            },
                          ),
                        ],
                      );
                    });
            }
          } else {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: Colors.white,
                    title: const Text('Falha ao enviar.'),
                    content:
                        const Text('Favor insira os dados corretos no campo!'),
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
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                extBack2.positionIndicator = index;
              });
            },
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF6E3385), Color(0xFFC67E89)],
                  ),
                ),
                child: Column(children: [
                  Expanded(child: extBack2.icon()),
                  Expanded(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 1.5,
                      height: MediaQuery.of(context).size.height / 4,
                      child: TextFormField(
                        controller: controllerWeight,
                        maxLength: 4,
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'^\d+\.?\d{0,2}')),
                          TextInputFormatter.withFunction((oldValue, newValue) {
                            if (newValue.text.contains(',')) {
                              return newValue.copyWith(
                                text: newValue.text.replaceAll(',', '.'),
                              );
                            }
                            return newValue;
                          }),
                        ],
                        decoration: const InputDecoration(
                            constraints: BoxConstraints.expand(),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors
                                      .white), // Cor da linha quando o campo não está em foco
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors
                                      .white), // Cor da linha quando o campo está em foco
                            ),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            prefix: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.edit_document,
                                color: Colors.white,
                              ),
                            ),
                            suffix: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'kg',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontFamily: 'Abril'),
                              ),
                            ),
                            label: Text(
                              'PESO',
                              style: TextStyle(
                                  color: Colors.white, fontFamily: 'Abril'),
                            ),
                            labelStyle: TextStyle(
                              fontSize: 30,
                            ),
                            hintText: 'ex: 95.7',
                            hintStyle: TextStyle(fontSize: 20)),
                        showCursor: false,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontFamily: 'Abril',
                        ),
                      ),
                    ),
                  )
                ]),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF6E3385), Color(0xFFC67E89)],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(flex: 2, child: extBack2.icon()),
                        Expanded(
                          flex: 3,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 1.5,
                            height: MediaQuery.of(context).size.height / 4,
                            child: TextFormField(
                              controller: controllerHeight,
                              maxLength: 4,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true),
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'^\d+\.?\d{0,2}')),
                                TextInputFormatter.withFunction(
                                    (oldValue, newValue) {
                                  if (newValue.text.contains(',')) {
                                    return newValue.copyWith(
                                      text: newValue.text.replaceAll(',', '.'),
                                    );
                                  }
                                  return newValue;
                                }),
                              ],
                              decoration: const InputDecoration(
                                  constraints: BoxConstraints.expand(),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors
                                            .white), // Cor da linha quando o campo não está em foco
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors
                                            .white), // Cor da linha quando o campo está em foco
                                  ),
                                  border: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  prefix: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.edit_document,
                                      color: Colors.white,
                                    ),
                                  ),
                                  suffix: Text(
                                    'm',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontFamily: 'Abril'),
                                  ),
                                  label: Text(
                                    'ALTURA',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Abril'),
                                  ),
                                  labelStyle: TextStyle(
                                    fontSize: 30,
                                  ),
                                  hintText: 'ex: 1.72',
                                  hintStyle: TextStyle(fontSize: 20)),
                              showCursor: false,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                                fontFamily: 'Abril',
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  iconSize: 100,
                                  onPressed: () {
                                    setState(() {
                                      extBack2.colorButton = true;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.man_2_rounded,
                                    color: extBack2.colorButton == true
                                        ? Colors.white
                                        : Colors.black,
                                  )),
                              Container(
                                height: 100,
                                width: 5,
                                color: Colors.white,
                              ),
                              IconButton(
                                  iconSize: 100,
                                  onPressed: () {
                                    setState(() {
                                      extBack2.colorButton = false;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.woman_2_rounded,
                                    color: extBack2.colorButton == false
                                        ? Colors.white
                                        : Colors.black,
                                  ))
                            ],
                          ),
                        )
                      ]),
                ),
              ),
              TelaFinal(
                  extBack2.resultadoFinal,
                  extBack2.altura,
                  MediaQuery.of(context).size.height,
                  MediaQuery.of(context).size.width,
                  getWidgetIcon(),
                  extBack2.textoFinal)
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                indicator.PageViewDotIndicator(
                    currentItem: extBack2.positionIndicator,
                    count: 3,
                    unselectedColor: Colors.black,
                    selectedColor: Colors.white)
              ],
            ),
          )
        ],
      ),
      floatingActionButton: extBack2.positionIndicator != 2
          ? FloatingActionButton(
              onPressed: () {
                verificadorTransicao();
              },
              elevation: 5,
              splashColor: Colors.pink,
              hoverColor: Colors.black12,
              child: const Icon(Icons.keyboard_arrow_down),
            )
          : FloatingActionButton(
              backgroundColor: Colors.transparent,
              onPressed: () {
                extBack2.floatInformacoes(context);
              },
              child: const Icon(Icons.info)),
    );
  }
}
