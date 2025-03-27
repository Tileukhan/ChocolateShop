import 'package:chocolate_shop/widgets/appbar.dart';
import 'package:chocolate_shop/widgets/button.dart';
import 'package:chocolate_shop/widgets/textfields.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _register() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Registration Successful!')));
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? 'Registration failed')),
      );
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
      appBar: CustomAppBar(title: 'Choco Bliss'),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.cake, size: 80, color: Colors.brown),
              SizedBox(height: 24),

              // Title
              Text(
                'Create an Account',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 24),

              CustomTextfields(
                controller: _emailController,
                hintText: 'Enter your email',
                labelText: 'Email',
                onChanged: (value) {},
              ),
              SizedBox(height: 16),

              CustomTextfields(
                controller: _passwordController,
                hintText: 'Enter your password',
                labelText: 'Password',
                obscureText: true,
                onChanged: (value) {},
              ),
              SizedBox(height: 24),

              CustomButton(
                text: "Register",
                onPressed: _register,
                color: Colors.brown,
              ),
              SizedBox(height: 16),

              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Already have an account? Log in',
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
