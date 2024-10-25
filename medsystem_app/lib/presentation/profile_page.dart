import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Imagen de fondo
          Image.asset(
            'assets/images/fondo.jpg', // Cambia esto por la ruta de tu imagen en assets
            fit: BoxFit.cover,
          ),
          // Capa de sombra
          Container(
            color: const Color.fromARGB(255, 17, 18, 20).withOpacity(0.5), // Sombra sobre la imagen
          ),
          // Contenido
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: const EdgeInsets.all(20.0),
                
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage('https://via.placeholder.com/150'), // Cambia esto por la URL de la imagen del usuario
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Nombre del Usuario',
                      style: TextStyle(fontSize: 24,
                      color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'correo@ejemplo.com',
                      style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                    const Text(
                      'dni:12345678',
                      style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                    const SizedBox(height: 32),
                    OutlinedButton(
                      onPressed: () {
                        // Acción del botón
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.white), // Borde blanco
                        backgroundColor: Colors.transparent, // Fondo transparente
                      ),
                      child: const Text(
                        'Regresar',
                        style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)), // Texto blanco
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // AppBar en la parte superior
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              title: const Text('Perfil del Usuario'),
              backgroundColor: const Color.fromARGB(0, 244, 242, 242), // Hacer el AppBar transparente
              elevation: 0, // Sin sombra
            ),
          ),
        ],
      ),
    );
  }
}