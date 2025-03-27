import 'package:chocolate_shop/screens/home_screen.dart'; // Импорт HomeScreen
import 'package:chocolate_shop/widgets/appbar.dart';
import 'package:chocolate_shop/widgets/button.dart';
import 'package:chocolate_shop/widgets/textfields.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key}); // Добавлен const конструктор для оптимизации

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _login() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Login Successful!')));
      Navigator.pushReplacementNamed(context, '/main'); // Изменено на /main
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.message ?? 'Login failed')));
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Choco Bliss'),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo/Icon at the top
              const Icon(Icons.cake, size: 80, color: Colors.brown),
              const SizedBox(height: 24),

              // Title
              const Text(
                'Welcome Back!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),

              // Custom TextFields
              CustomTextfields(
                controller: _emailController,
                hintText: 'Enter your email',
                labelText: 'Email',
                onChanged: (value) {},
              ),
              const SizedBox(height: 16),

              CustomTextfields(
                controller: _passwordController,
                hintText: 'Enter your password',
                labelText: 'Password',
                obscureText: true,
                onChanged: (value) {},
              ),
              const SizedBox(height: 24),

              CustomButton(
                text: "Login",
                onPressed: _login,
                color: Colors.brown,
              ),
              const SizedBox(height: 16),

              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: const Text(
                  'Don’t have an account? Sign up',
                  style: TextStyle(color: Colors.brown),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
