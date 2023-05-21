import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:parcial042550302018/services/firebase.dart';

class MostrarVehiculos extends StatefulWidget {
  const MostrarVehiculos({super.key});

  @override
  State<MostrarVehiculos> createState() => _MostrarVehiculosState();
}

class _MostrarVehiculosState extends State<MostrarVehiculos> {
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
                  "Vehiculos",
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
                        future: getVehiculos(),
                        builder: ((context, snapshot) {
                          if (snapshot.hasData) {
                            return GridView.builder(
                              padding: EdgeInsets.zero,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 1,
                                mainAxisSpacing: 1,
                                childAspectRatio: 2,
                              ),
                              scrollDirection: Axis.vertical,
                              itemCount: snapshot.data?.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        information = 'Editar Vehiculo';
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
                                                'Código: ${snapshot.data?[index]['idvehiculo']}'),
                                            Text(
                                                'Marca: ${snapshot.data?[index]['marca']}'),
                                            Text(
                                                'Modelo: ${snapshot.data?[index]['modelo']}'),
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
            await Navigator.pushNamed(context, '/addvehiculo');
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