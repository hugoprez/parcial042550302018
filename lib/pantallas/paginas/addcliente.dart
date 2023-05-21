import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:parcial042550302018/services/firebase.dart';

class addcliente extends StatefulWidget {
  const addcliente({super.key});

  @override
  State<addcliente> createState() => _addclienteState();
}

class _addclienteState extends State<addcliente> {
  TextEditingController IdController = TextEditingController();
  TextEditingController NombreController = TextEditingController(text: "");
  TextEditingController ApellidoController = TextEditingController(text: "");
  TextEditingController direccionController = TextEditingController(text: "");
  TextEditingController ciudadController = TextEditingController(text: "");

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
                'Agregar Cliente',
                style: TextStyle(fontSize: 24),
              ),
            ),
            TextFormField(
              controller: IdController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Ingrese un número entero',
              ),
              
            ),
            TextField(
              controller: NombreController,
              decoration: InputDecoration(hintText: 'Ingrese el nombre'),
            ),
            TextField(
              controller: ApellidoController,
              decoration: InputDecoration(hintText: 'Ingrese el apellido'),
            ),
            TextField(
              controller: direccionController,
              decoration:
                  InputDecoration(hintText: 'Ingrese la dirección'),
            ),
            TextField(
              controller: ciudadController,
              decoration:
                  InputDecoration(hintText: 'Ingrese la ciudad'),
            ),
            ElevatedButton(
                onPressed: () async {
             
                  await agregarclientes(int.parse(IdController.text),NombreController.text,ApellidoController.text,direccionController.text,ciudadController.text)
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
