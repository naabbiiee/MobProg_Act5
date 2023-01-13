import 'package:act5ass/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Activity 5',
          theme: ThemeData(
              primarySwatch: Colors.brown ),
          home: const Home())
  );

}
