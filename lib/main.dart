import 'package:flutter/material.dart';
import 'package:todoey_flutter/screens/tasks_screen.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/providers.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => TaskData(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TasksScreen(),
    );
  }
}

// class Data extends ChangeNotifier {
//   bool isDone = false;
//   void toggleBetween() {
//     isDone = !isDone;
//     notifyListeners();
//   }
// }
