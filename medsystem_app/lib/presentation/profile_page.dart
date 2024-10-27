import 'package:flutter/material.dart';
import 'package:medsystem_app/services/auth/auth_service.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  String? userEmail;

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  void logout() {
    final authService = AuthService();
    authService.signOut();
  }

  void loadUser() async {
    final authService = AuthService();
    final email = await authService
        .getCurrentUserEmail(); // Método ficticio que obtiene el correo del usuario actual
    setState(() {
      userEmail = email;
    });
  }

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
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                          'https://via.placeholder.com/150'), // Cambia esto por la URL de la imagen del usuario
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Nombre del Usuario',
                      style: TextStyle(
                          fontSize: 24,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      userEmail ?? 'Cargando...',
                      style: const TextStyle(
                          fontSize: 16, color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    const Text(
                      'dni:12345678',
                      style: TextStyle(
                          fontSize: 16, color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    const SizedBox(height: 32),
                    OutlinedButton(
                      onPressed: () {
                        logout();
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                            color: Colors.white), // Borde blanco
                        backgroundColor:
                            Colors.transparent, // Fondo transparente
                      ),
                      child: const Text(
                        'Regresar',
                        style: TextStyle(
                            color:
                                Color.fromARGB(255, 0, 0, 0)), // Texto blanco
                      ),
                    ),
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
