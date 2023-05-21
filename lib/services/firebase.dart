import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore base = FirebaseFirestore.instance;

Future<List> getclientes() async{
  List clientes=[];

  CollectionReference CollectionReferenceclientes=base.collection('clientes');
  QuerySnapshot queryclientes= await CollectionReferenceclientes.get();
  queryclientes.docs.forEach((documentos) {
    clientes.add(documentos.data());
   });
  return clientes;
}

//guardar usuario
Future<void> agregarclientes(int Idcliente, String nombrecliente,String apellidocliente,String direccioncliente, String ciudadcliente) async {
   await base.collection('clientes').add({
    "Idcliente": Idcliente,
    "nombrecliente": nombrecliente,
    "apellidocliente": apellidocliente,
    "direccioncliente": direccioncliente,
     "ciudadcliente": ciudadcliente,
  });
}


Future<List> getVehiculos() async{
  List vehiculos=[];
  CollectionReference CollectionReferencevehiculos=base.collection('vehiculos');
  QuerySnapshot queryvehiculos= await CollectionReferencevehiculos.get();
  queryvehiculos.docs.forEach((documentos) {
    vehiculos.add(documentos.data());
   });
  return vehiculos;
}

//guardar vehiculo
Future<void> agregarvehiculo(int idvehiculo, String marca,String modelo) async {
   await base.collection('vehiculos').add({
    "idvehiculo": idvehiculo,
    "marca": marca,
    "modelo": modelo,
  });
}