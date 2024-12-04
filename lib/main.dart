import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Hello, World',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

    void next () {
        current = WordPair.random();
        notifyListeners();
    }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(body: Center(
      child: Builder(builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text('Hello, World!'),
              const SizedBox(height: 20),
              Text('A random idea:'),
              Text(appState.current.asLowerCase),
              Text('Eu amo a Biga!!'),
              ElevatedButton(
                onPressed: () {
                  appState.next();
                },
                child: const Text('Generate a new ideia'),
              ),
            ],
          ),
        );
      }),
    ));
  }
}
