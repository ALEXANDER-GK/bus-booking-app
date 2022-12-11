import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rapid/controller/page_controller.dart';
import 'package:rapid/login_page.dart';
import 'package:rapid/otherpages/payment.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 243, 241, 241),
        textTheme: TextTheme(
            bodyText2: TextStyle(color: Color.fromARGB(255, 14, 13, 13))),
        primaryColor: Color.fromARGB(255, 255, 255, 255),
        hintColor: Color.fromARGB(225, 184, 112, 228),
        focusColor: Color.fromARGB(225, 184, 112, 228),
        hoverColor: Color.fromARGB(225, 184, 112, 228),
        indicatorColor: Color.fromARGB(224, 255, 255, 255),
        splashColor: Color.fromARGB(255, 125, 99, 117),
        highlightColor: Color.fromARGB(225, 184, 112, 228),
      ),
      home: login_page(),
    );
  }
}
