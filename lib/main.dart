import 'package:WorldTime/pages/loading.dart';
import 'package:WorldTime/pages/location.dart';
import 'package:flutter/material.dart';
import 'package:WorldTime/pages/home.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => Location(),
    },
  ));
}
