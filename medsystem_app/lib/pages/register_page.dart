import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medsystem_app/services/auth/auth_gate.dart';
import 'package:medsystem_app/services/auth/auth_service.dart';
import 'package:medsystem_app/pages/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController dniController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  String? selectedRole;
  String? selectedSpecialty;

  void register(BuildContext context) async {
    final auth = AuthService();

    try {
      // Registra al usuario y devuelve el UserCredential
      UserCredential userCredential = await auth.signUpWithEmailAndPassword(
        emailController.text,
        passwordController.text,
      );

      // Verifica si el usuario se registró correctamente
      if (userCredential.user != null) {
        // Redirige al usuario a la pantalla principal
        if (mounted) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const AuthGate()),
            (route) => false, // Elimina todas las rutas anteriores
          );
        }
      }
    } catch (e) {
      // Muestra un diálogo de error si algo sale mal
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: Text(e.toString()),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/images/fondo.jpg',
          fit: BoxFit.cover,
        ),
        Container(
          color: Colors.black.withOpacity(0.5),
          child: Scaffold(
            backgroundColor: const Color.fromARGB(170, 10, 31, 50),
            body: _page(),
          ),
        ),
      ],
    );
  }

  Widget _page() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _inputField("First name", firstNameController),
            const SizedBox(
              height: 10,
            ),
            _inputField("Last name", lastNameController),
            const SizedBox(
              height: 10,
            ),
            _inputField("DNI", dniController),
            const SizedBox(
              height: 10,
            ),
            _inputField("Email", emailController),
            const SizedBox(
              height: 10,
            ),
            _inputField("Password", passwordController, isPassword: true),
            const SizedBox(
              height: 10,
            ),
            _roleSelection(),
            if (selectedRole == "Doctor") _specialtySelection(),
            const SizedBox(
              height: 10,
            ),
            _registerBtn(),
            const SizedBox(
              height: 10,
            ),
            _extraText()
          ],
        ),
      ),
    );
  }

  Widget _inputField(String hintText, TextEditingController controller,
      {isPassword = false}) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      controller: controller,
      decoration: InputDecoration(
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white)),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white),
      ),
      obscureText: isPassword,
    );
  }

  Widget _roleSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Select Role:",
          style: TextStyle(color: Colors.white),
        ),
        RadioListTile<String>(
          title: const Text("Doctor", style: TextStyle(color: Colors.white)),
          value: "Doctor",
          activeColor: Colors.white,
          groupValue: selectedRole,
          onChanged: (value) {
            setState(() {
              selectedRole = value;
              selectedSpecialty = null;
            });
          },
        ),
        RadioListTile<String>(
          title: const Text("Patient", style: TextStyle(color: Colors.white)),
          value: "Patient",
          activeColor: Colors.white,
          groupValue: selectedRole,
          onChanged: (value) {
            setState(() {
              selectedRole = value;
              selectedSpecialty = null; // Reiniciar la especialidad
            });
          },
        ),
      ],
    );
  }

  Widget _specialtySelection() {
    return Column(
      children: [
        DropdownButton<String>(
          hint: const Text(
            "Select Specialty",
            style: TextStyle(color: Colors.white),
          ),
          value: selectedSpecialty,
          items: const [
            DropdownMenuItem(
              value: "Specialty 1",
              child: Text("Specialty 1",
                  style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
            ),
            DropdownMenuItem(
              value: "Specialty 2",
              child: Text("Specialty 2",
                  style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
            ),
            DropdownMenuItem(
              value: "Specialty 3",
              child: Text("Specialty 3",
                  style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
            ),
          ],
          onChanged: (value) {
            setState(() {
              selectedSpecialty = value;
            });
          },
          dropdownColor:
              const Color.fromARGB(255, 73, 73, 73), // Color del dropdown
        ),
      ],
    );
  }

  Widget _registerBtn() {
    return ElevatedButton(
      onPressed: () {
        register(context);
        debugPrint("First Name: ${firstNameController.text}");
        debugPrint("Last Name: ${lastNameController.text}");
        debugPrint("DNI: ${dniController.text}");
        debugPrint("Email: ${emailController.text}");
        debugPrint("Password: ${passwordController.text}");
      },
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
      ),
      child: const SizedBox(
          width: double.infinity,
          child: Text(
            "Sign up",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 0, 0, 0)),
          )),
    );
  }

  Widget _extraText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Do you have an account?",
          style: TextStyle(color: Colors.white),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          },
          child: const Text("Sign in",
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold)),
        )
      ],
    );
  }
}
