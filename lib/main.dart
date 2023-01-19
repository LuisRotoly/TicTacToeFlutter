import 'package:first_flutter_app/game_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'TicTacToe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = TextEditingController();
  final controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 100.0,
            ),
            const Text(
              'TicTacToe',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40.0,
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            const Text(
              "Coloque o nome do primeiro jogador:",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300.0,
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30.0,
            ),
            const Text(
              "Coloque o nome do segundo jogador:",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300.0,
                  child: TextField(
                    controller: controller2,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                  ),
                  child: const Text(
                    'Jogar',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    if (controller2.text == "" || controller.text == "") {
                      return;
                    } else {
                      final input = controller.text;
                      controller.clear();
                      final input2 = controller2.text;
                      controller2.clear();
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return GamePage(
                                userName1: input, userName2: input2);
                          },
                        ),
                      );
                    }
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
