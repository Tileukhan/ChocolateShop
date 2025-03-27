import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/appbar.dart';
import '../widgets/button.dart';
import '../widgets/textfields.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final User? user = FirebaseAuth.instance.currentUser;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    if (user != null) {
      final doc =
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user!.uid)
              .get();
      if (doc.exists) {
        final data = doc.data()!;
        _firstNameController.text = data['firstName'] ?? '';
        _lastNameController.text = data['lastName'] ?? '';
        _phoneController.text = data['phone'] ?? '';
      }
      setState(() => _isLoading = false);
    }
  }

  Future<void> _saveUserData() async {
    if (user != null) {
      await FirebaseFirestore.instance.collection('users').doc(user!.uid).set({
        'firstName': _firstNameController.text.trim(),
        'lastName': _lastNameController.text.trim(),
        'phone': _phoneController.text.trim(),
        'email': user!.email,
      }, SetOptions(merge: true));
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Profile updated!')));
    }
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Chocolate Shop'),
      body:
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Profile',
                      style: TextStyle(
                        fontFamily: 'PlayfairDisplay',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4A2C2A),
                      ),
                    ),
                    const SizedBox(height: 16),
                    CustomTextfields(
                      labelText: 'First Name',
                      controller: _firstNameController,
                    ),
                    const SizedBox(height: 16),
                    CustomTextfields(
                      labelText: 'Last Name',
                      controller: _lastNameController,
                    ),
                    const SizedBox(height: 16),
                    CustomTextfields(
                      labelText: 'Phone',
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 24),
                    CustomButton(
                      text: 'Save Changes',
                      onPressed: _saveUserData,
                      color: const Color(0xFFF4A261),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
    );
  }
}
