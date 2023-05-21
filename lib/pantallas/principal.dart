import 'package:flutter/material.dart';
import 'package:parcial042550302018/pantallas/menu/mostrarclientes.dart';
import 'package:parcial042550302018/pantallas/menu/mostrarautos.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  int ItemSeleccionadoIndex = 0;

  void _NavigationBotonBar(int index) {
    setState(() {
      ItemSeleccionadoIndex = index;
    });
  }
//MostrarClientes(), 
  final List<Widget> _Paginas = [
    MostrarClientes(),
    MostrarVehiculos(),
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: _Paginas[ItemSeleccionadoIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: ItemSeleccionadoIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _NavigationBotonBar,
        items: [BottomNavigationBarItem(icon: Icon(Icons.person_outline_rounded), label: "Clientes"),
                BottomNavigationBarItem(icon: Icon(Icons.car_crash), label: "Vehiculo"),
        ],
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
      ),
    );
  }
}
/*
class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
    //home: Principal()
     initialRoute: '/',
      routes: {
        '/':(context) => const Principal(),
        '/add':(context) => const addcliente(),
        //'/edit':(context) => const Modificar_user()
      },
    );
  }
}*/
