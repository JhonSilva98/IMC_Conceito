import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:intl/intl.dart';

Widget TelaFinal(double resultadoFinal, double altura, double width,
    double height, Widget iconPers, String textFinal) {
  return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.white, // Define a cor desejada para o ícone
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xFF6E3385), Color(0xFFC67E89)],
            ),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Expanded(
              child: Text("IMC - John Silva",
                  style: TextStyle(color: Colors.white, fontFamily: 'Abril')),
            ),
            Expanded(
              child: Image.asset(
                'assets/dashboardMod.png',
                height: 200,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF6E3385), Color(0xFFC67E89)],
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(8.0),
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  SfRadialGauge(
                    animationDuration: 3500,
                    enableLoadingAnimation: true,
                    axes: <RadialAxis>[
                      RadialAxis(
                          minimum: 0,
                          maximum: 45,
                          interval: 5,
                          minorTicksPerInterval: 9,
                          showAxisLine: true,
                          radiusFactor: 0.8,
                          labelOffset: 8,
                          ranges: <GaugeRange>[
                            GaugeRange(
                                startValue: 0,
                                endValue: 18.5,
                                startWidth: 0.265,
                                sizeUnit: GaugeSizeUnit.factor,
                                endWidth: 0.265,
                                color:
                                    const Color.fromARGB(180, 158, 158, 158)),
                            GaugeRange(
                                startValue: 18.5,
                                endValue: 24.9,
                                startWidth: 0.265,
                                sizeUnit: GaugeSizeUnit.factor,
                                endWidth: 0.265,
                                color: const Color.fromARGB(193, 76, 175, 79)),
                            GaugeRange(
                                startValue: 24.9,
                                endValue: 29,
                                startWidth: 0.265,
                                sizeUnit: GaugeSizeUnit.factor,
                                endWidth: 0.265,
                                color: const Color.fromARGB(188, 255, 235, 59)),
                            GaugeRange(
                                startValue: 29,
                                endValue: 34.9,
                                startWidth: 0.265,
                                sizeUnit: GaugeSizeUnit.factor,
                                endWidth: 0.265,
                                color: const Color.fromARGB(181, 255, 153, 0)),
                            GaugeRange(
                                startValue: 34.9,
                                endValue: 39,
                                startWidth: 0.265,
                                sizeUnit: GaugeSizeUnit.factor,
                                endWidth: 0.265,
                                color: const Color.fromARGB(184, 244, 67, 54)),
                            GaugeRange(
                                startValue: 39,
                                endValue: 45,
                                startWidth: 0.265,
                                sizeUnit: GaugeSizeUnit.factor,
                                endWidth: 0.265,
                                color: const Color.fromARGB(181, 151, 12, 2)),
                          ],
                          annotations: <GaugeAnnotation>[
                            const GaugeAnnotation(
                                angle: 90,
                                positionFactor: 0.35,
                                widget: Text('IMC',
                                    style: TextStyle(
                                        color: Color(0xFFF8B195),
                                        fontSize: 16))),
                            GaugeAnnotation(
                              angle: 90,
                              positionFactor: 0.8,
                              horizontalAlignment: GaugeAlignment.center,
                              verticalAlignment: GaugeAlignment.center,
                              widget: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  '  ${NumberFormat('0.00').format(resultadoFinal)}  ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: width / 20),
                                ),
                              ),
                            )
                          ],
                          pointers: <GaugePointer>[
                            NeedlePointer(
                              value: resultadoFinal,
                              needleStartWidth: 0,
                              needleEndWidth: 5,
                              animationType: AnimationType.easeOutBack,
                              enableAnimation: true,
                              animationDuration: 1200,
                              knobStyle: const KnobStyle(
                                  knobRadius: 0.09,
                                  borderColor: Color(0xFFF8B195),
                                  color: Colors.white,
                                  borderWidth: 0.05),
                              tailStyle: const TailStyle(
                                  color: Color(0xFFF8B195),
                                  width: 8,
                                  length: 0.2),
                              needleColor: const Color(0xFFF8B195),
                            )
                          ],
                          axisLabelStyle: const GaugeTextStyle(fontSize: 12),
                          majorTickStyle: const MajorTickStyle(
                              length: 0.25, lengthUnit: GaugeSizeUnit.factor),
                          minorTickStyle: const MinorTickStyle(
                              length: 0.13,
                              lengthUnit: GaugeSizeUnit.factor,
                              thickness: 1))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Flexible(
                            flex: 2,
                            child: Container(
                              height: 90,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10)),
                                color: Color.fromARGB(67, 76, 175, 79),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(
                                    child: Text(
                                  "Seu peso ideal deve estar entre:",
                                  style: TextStyle(
                                      fontFamily: 'Abril',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )),
                              ),
                            )),
                        Flexible(
                            flex: 1,
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                                color: Colors.green,
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "${NumberFormat('0.0').format(18.5 * (altura * altura))} kg\n     - \n${NumberFormat('0.0').format(24.9 * (altura * altura))} kg",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Abril',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                              ),
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 8)),
            Container(
              height: height / 1.1,
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Resultados IMC:",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ))
                    ],
                  ),
                ),
                iconPers,
                Expanded(
                    child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        textFinal,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ))
              ]),
            ),
          ],
        ),
      ));
}
