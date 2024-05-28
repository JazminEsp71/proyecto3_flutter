import 'package:flutter/cupertino.dart';
import 'package:proyecto_p3_flutter/screens/login.dart';

class PlantApp extends StatelessWidget{
  const PlantApp({super.key});

@override
  Widget build(BuildContext context){
    return const CupertinoApp(
      title: 'Diario de plantas',
      home: LoginScreen(),
      theme: CupertinoThemeData(
        primaryColor: CupertinoColors.activeGreen,
        brightness: Brightness.light),
      debugShowCheckedModeBanner: false,
    );
  }
}