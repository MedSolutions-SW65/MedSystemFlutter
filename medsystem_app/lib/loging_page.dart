import 'package:flutter/material.dart';
import 'package:medsystem_app/homepage.dart';
import 'package:medsystem_app/register_page.dart';

class LogingPage extends StatefulWidget {
  const LogingPage({super.key});

  @override
  State<LogingPage> createState() => _LogingPageState();
}

class _LogingPageState extends State<LogingPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
            _icon(),
            const SizedBox(
              height: 50,
            ),
            _inputField("Email", emailController),
            const SizedBox(
              height: 20,
            ),
            _inputField("Password", passwordController, isPassword: true),
            const SizedBox(
              height: 50,
            ),
            _loginBtn(),
            const SizedBox(
              height: 20,
            ),
            _extraText()
          ],
        ),
      ),
    );
  }

  Widget _icon() {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 2),
            shape: BoxShape.circle),
        child: const Icon(
          Icons.person,
          color: Colors.white,
          size: 120,
        ));
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

  Widget _loginBtn() {
    return ElevatedButton(
      onPressed: () {
        debugPrint("Email: ${emailController.text}");
        debugPrint("Password: ${passwordController.text}");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Homepage()),
        );
      },
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
      ),
      child: const SizedBox(
          width: double.infinity,
          child: Text(
            "Sign in",
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
          "Don't have an account?",
          style: TextStyle(color: Colors.white),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RegisterPage()),
            );
          },
          child: const Text("Sign up",
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold)),
        )
      ],
    );
  }
}
