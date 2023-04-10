import 'dart:math';

import 'package:flutter/material.dart';

import 'constants/constants.dart';
import 'constants/ui_constants.dart';
import 'theme/theme.dart';
import 'widgets/number_field.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Square? Cube?',
      theme: AppTheme.theme,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AppBar appbar = UIConstants.appBar();
  final TextEditingController numberController = TextEditingController();
  String printText = '';

  bool validateInputNumber(String value) {
    if (value.isEmpty) {
      return false;
    }
    final num? n = num.tryParse(value);
    if (n == null) {
      return false;
    }
    return true;
  }

  @override
  void dispose() {
    super.dispose();
    numberController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(
              vertical: 30, horizontal: 15),
          child: Column(
            children: <Widget> [
              const Text(
                AppWriteConstants.upperTextFieldText,
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: InputFieldBox(
                  controller: numberController,
                  hintText: 'Number: ', validate: false,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (validateInputNumber(numberController.text)) {
            final int result = int.parse(numberController.text);
            setState(
              () {
                bool isCube(int n) {
                  final int cubeRoot = pow(n, 1 / 3).round();
                  return cubeRoot * cubeRoot * cubeRoot == n;
                }

                bool isSquared(int n) {
                  final int sqrtNum = sqrt(n).toInt();
                  return sqrtNum * sqrtNum == n;
                }

                String checkNumber(int n) {
                  if (isCube(n) && isSquared(n)) {
                    return "'$n' is both a square and a cube!";
                  } else if (isCube(n)) {
                    return "'$n' is a cube number!";
                  } else if (isSquared(n)) {
                    return "'$n' is a squared number!";
                  } else {
                    return "'$n' is neither a cube nor a square!";
                  }
                }

                printText = checkNumber(result);
                // Text(printText);

                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Center(child: Text('Informer')),
                    content: Text(printText),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'OK'),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            setState(() {
              printText = 'The input has to be an integer!';
              Text(
                printText,
                style: const TextStyle(
                  color: Colors.red,
                ),
              );
            });
          }
        },
        tooltip: 'Check...',
        backgroundColor: Palette.appBarBackgroundColor,
        splashColor: Colors.deepPurple,
        child: const Icon(Icons.check),
      ),
    );
  }
}
