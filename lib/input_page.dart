import 'package:flutter/material.dart';

class InputPage extends StatelessWidget {
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController apellidoController = TextEditingController();
  final TextEditingController latitudController = TextEditingController();
  final TextEditingController longitudController = TextEditingController();

  InputPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entrada de Datos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nombreController,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
            TextField(
              controller: apellidoController,
              decoration: const InputDecoration(labelText: 'Apellido'),
            ),
            TextField(
              controller: latitudController,
              decoration: const InputDecoration(labelText: 'Latitud'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: longitudController,
              decoration: const InputDecoration(labelText: 'Longitud'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/map', arguments: {
                  'nombre': nombreController.text,
                  'apellido': apellidoController.text,
                  'latitud': double.parse(latitudController.text),
                  'longitud': double.parse(longitudController.text),
                });
              },
              child: const Text('Siguiente'),
            ),
          ],
        ),
      ),
    );
  }
}
