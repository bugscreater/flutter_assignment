import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todoapp/screens/Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key?key}) : super(key: key);

  // This widget is the root of the application...

  @override
  Widget build(BuildContext context){
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
     return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      home: Home(),
     );
  }
}
