import 'package:flutter/material.dart';
import 'package:world_time_app/Pages/chooseLocation.dart';
import 'package:world_time_app/Pages/home.dart';
import 'package:world_time_app/Pages/loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    },
  ));
}