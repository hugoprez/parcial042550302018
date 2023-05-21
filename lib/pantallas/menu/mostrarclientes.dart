import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:parcial042550302018/services/firebase.dart';

class MostrarClientes extends StatefulWidget {
  const MostrarClientes({super.key});

  @override
  State<MostrarClientes> createState() => _MostrarClientesState();
}

class _MostrarClientesState extends State<MostrarClientes> {
    String information = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[300],
        ),
        body: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  "Clientes",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Expanded(
                child: 
                    GridView(
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 1,
                  ),
                  scrollDirection: Axis.vertical,
                  children: [
                    Container(
                      child: FutureBuilder(
                        future: getclientes(),
                        builder: ((context, snapshot) {
                          if (snapshot.hasData) {
                            return GridView.builder(
                              padding: EdgeInsets.zero,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 1,
                                mainAxisSpacing: 1,
                                childAspectRatio: 1,
                              ),
                              scrollDirection: Axis.vertical,
                              itemCount: snapshot.data?.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        information = 'Editar Cliente';
                                      });
                                      //showDialogWithInformation();
                                    },
                                    child: Card(
                                      elevation: 8.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.all(20),
                                        child: Column(
                                          children: [
                                            Text(
                                                'Código: ${snapshot.data?[index]['Idcliente']}'),
                                            Text(
                                                'Nombre: ${snapshot.data?[index]['nombrecliente']}'),
                                            Text(
                                                'Apellido: ${snapshot.data?[index]['apellidocliente']}'),
                                            Text(
                                                'Ciudad: ${snapshot.data?[index]['ciudadcliente']}'),
                                            Text(
                                                'Dirección: ${snapshot.data?[index]['direccioncliente']}'),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await Navigator.pushNamed(context, '/add');
            //actualiza los datos al agregar un usuario
            setState(() {});
            //print("Actualizar");
          },
          backgroundColor: Colors.red,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}


