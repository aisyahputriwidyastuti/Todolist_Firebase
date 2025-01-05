import 'package:flutter/material.dart';
import 'package:base_todolist/view/login_page.dart'; // Sudah sesuai dengan struktur
import 'package:base_todolist/service/firebase_options.dart'; // Disesuaikan dengan direktori
import 'package:firebase_core/firebase_core.dart'; // Firebase Core

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // File ini sudah ada di direktori "service"
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo-List App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}
