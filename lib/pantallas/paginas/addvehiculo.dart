import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:parcial042550302018/services/firebase.dart';

class addvehiculo extends StatefulWidget {
  const addvehiculo({super.key});

  @override
  State<addvehiculo> createState() => _addvehiculoState();
}

class _addvehiculoState extends State<addvehiculo> {
  TextEditingController IdController = TextEditingController();
  TextEditingController marcaController = TextEditingController(text: "");
  TextEditingController modeloController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.red[300],
      ),
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Column(
          children: [
            Center(
              child: const Text(
                'Agregar Vehiculo',
                style: TextStyle(fontSize: 24),
              ),
            ),
            TextFormField(
              controller: IdController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Ingrese el codigo',
              ),
              
            ),
            TextField(
              controller: marcaController,
              decoration: InputDecoration(hintText: 'Ingrese el marca'),
            ),
            TextField(
              controller: modeloController,
              decoration: InputDecoration(hintText: 'Ingrese el modelo'),
            ),
            
            ElevatedButton(
                onPressed: () async {
             
                  await agregarvehiculo(int.parse(IdController.text),marcaController.text,modeloController.text)
                      .then((_) {
                    Navigator.pop(context);
                  });
                  setState(() {});
                },
                child: Text("Guardar registro"),
                )
          ],
        ),
      ),
    );
  }
}
