import 'package:flutter/material.dart';
import 'package:parcial042550302018/pantallas/principal.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:parcial042550302018/pantallas/paginas/addcliente.dart';
import 'package:parcial042550302018/pantallas/paginas/addvehiculo.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
    //home: Principal()
     initialRoute: '/',
      routes: {
        '/':(context) => const Principal(),
        '/add':(context) => const addcliente(),
        '/addvehiculo':(context) => const addvehiculo(),
      },
    );
  }
}
