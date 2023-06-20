import 'package:flutter/material.dart';
import 'package:imc_conceito/Tela_1/back_1.dart';
import 'package:imc_conceito/Tela_2/telaSecundaria.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IMC',
      theme: ThemeData.light(
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'IMC APP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var extBack1 = back1();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF6E3385), Color(0xFFC67E89)],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/dashboardMod.png',
                    height: MediaQuery.of(context).size.height / 3,
                  ),
                ),
                const Column(
                  children: [
                    Text(
                      'IMC',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Pacifico',
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "This is a concept of a BMI application with variables in Portuguese (Brazil).",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: FloatingActionButton(
                      backgroundColor: Colors.white,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      onPressed: () {
                        // Ação ao pressionar o botão
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const EnterData()));
                      },
                      child: const Text(
                        "START NOW!",
                        style: TextStyle(
                            fontFamily: 'Abril',
                            fontSize: 20,
                            color: Colors.black87,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: IconButton(
                          onPressed: () {
                            extBack1.alaunchUrl();
                          },
                          icon: Image.asset(
                            'assets/linkedin.png',
                            height: 50,
                          ),
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          onPressed: () {
                            extBack1.alaunchUrlGit();
                          },
                          icon: Image.asset(
                            'assets/github.png',
                            height: 30,
                          ),
                        ),
                      ),
                      const Expanded(
                        child: Text(
                          "John Silva",
                          style: TextStyle(
                              fontFamily: 'Monsieur',
                              color: Colors.white,
                              fontSize: 30),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
