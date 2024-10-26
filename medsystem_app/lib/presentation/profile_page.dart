import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Capa de sombra
          Container(
            color: const Color.fromARGB(255, 255, 255, 255)
                .withOpacity(0.5), // Sombra sobre la imagen
          ),
          // Contenido
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                          'https://via.placeholder.com/150'), // Cambia esto por la URL de la imagen del usuario
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Nombre del Usuario',
                      style: TextStyle(
                          fontSize: 24,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'correo@ejemplo.com',
                      style: TextStyle(
                          fontSize: 16, color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    Text(
                      'dni:12345678',
                      style: TextStyle(
                          fontSize: 16, color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ),
          // AppBar en la parte superior
        ],
      ),
    );
  }
}
