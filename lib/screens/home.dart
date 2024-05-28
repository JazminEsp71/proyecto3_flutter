import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_p3_flutter/service/planta_service.dart';
import 'package:proyecto_p3_flutter/models/planta.dart';

class HomePage extends StatefulWidget {
  const HomePage();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PlantaService _plantaService = PlantaService();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Lista de Plantas'),
      ),
      child: FutureBuilder<List<Planta>>(
        future: _plantaService.getAllPlantas(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final plantas = snapshot.data!;
            return ListView.builder(
              itemCount: plantas.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Image.network(plantas[index].foto, width: 100, height: 100, fit: BoxFit.cover),
                    title: Text(plantas[index].nombre),
                    subtitle: Text('Riego cada ${plantas[index].frecuenciaDeRiego} días'),
                  ),
                );
              },
            );
          } else {
            return Center(child: Text('No hay plantas disponibles'));
          }
        },
      ),
    );
  }
}
