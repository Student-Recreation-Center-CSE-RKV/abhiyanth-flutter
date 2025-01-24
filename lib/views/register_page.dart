import 'package:abhiyanth/services/custom_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../utilities/gradient_background.dart';
import '../services/size_config.dart';

class RegisterPage extends StatefulWidget {
  final String eventTitle;

  const RegisterPage({super.key, required this.eventTitle});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  late final String userId;
  bool _isRegistered = false;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    User? user = FirebaseAuth.instance.currentUser;
    userId = user?.uid ?? 'unknown_user';
    _checkIfRegistered(widget.eventTitle);
  }

  void _checkIfRegistered(String eventTitle) async {
    try {
      final doc = await _firestore
          .collection('Event-Registrations')
          .doc(userId)
          .collection('Events')
          .doc(eventTitle)
          .get();

      setState(() {
        _isRegistered = doc.exists;
      });
    } catch (e) {
      CustomSnackBar.show(
        context,
        "Error checking registration: $e",
        type: "error",
      );
    }
  }

  Future<void> _saveToFirestore(String eventTitle) async {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text;
      final id = _idController.text;
      final phone = _phoneController.text;

      try {
        await _firestore
            .collection('Event-Registrations')
            .doc(userId)
            .collection('Events')
            .doc(eventTitle)
            .set({
          'name': name,
          'id': id,
          'phone': phone,
          'eventTitle': eventTitle,
          'timestamp': FieldValue.serverTimestamp(),
        });

        CustomSnackBar.show(
          context,
          "Successfully registered for $eventTitle!",
        );

        setState(() {
          _isRegistered = true;
        });

        _nameController.clear();
        _idController.clear();
        _phoneController.clear();
      } catch (e) {
        CustomSnackBar.show(
          context,
          "Failed to register: $e",
          type: "error",
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final String eventTitle = widget.eventTitle;

    return GradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            'Register for $eventTitle',
            style: TextStyle(fontFamily: "Audiowide", color: Colors.white),
          ),
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.safeBlockHorizontal * 5),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(
                            SizeConfig.safeBlockHorizontal * 10),
                        gradient: LinearGradient(
                          colors: [Color(0xFFFF6AB7), Color(0xFF6AE4FF)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(
                              SizeConfig.safeBlockHorizontal * 10),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.safeBlockHorizontal * 3),
                        child: TextFormField(
                          controller: _nameController,
                          decoration: const InputDecoration(
                            labelText: 'Name',
                            labelStyle: TextStyle(color: Colors.white70, fontFamily: "Audiowide"),
                            border: InputBorder.none,
                          ),
                          style: const TextStyle(color: Colors.white , fontFamily: "Audiowide"),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Please enter your name'
                              : null,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.safeBlockHorizontal * 5),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(
                            SizeConfig.safeBlockHorizontal * 10),
                        gradient: LinearGradient(
                          colors: [Color(0xFFFF6AB7), Color(0xFF6AE4FF)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(
                              SizeConfig.safeBlockHorizontal * 10),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.safeBlockHorizontal * 3),
                        child: TextFormField(
                          controller: _idController,
                          decoration: const InputDecoration(
                            labelText: 'ID',
                            labelStyle: TextStyle(color: Colors.white70 , fontFamily: "Audiowide"),
                            border: InputBorder.none,
                          ),
                          style: const TextStyle(color: Colors.white , fontFamily: "Audiowide"),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Please enter your ID'
                              : null,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.safeBlockHorizontal * 5),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(
                            SizeConfig.safeBlockHorizontal * 10),
                        gradient: LinearGradient(
                          colors: [Color(0xFFFF6AB7), Color(0xFF6AE4FF)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(
                              SizeConfig.safeBlockHorizontal * 10),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.safeBlockHorizontal * 3),
                        child: TextFormField(
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            labelText: 'Phone',
                            labelStyle: TextStyle(color: Colors.white70 , fontFamily: "Audiowide"),
                            border: InputBorder.none,
                          ),
                          style: const TextStyle(color: Colors.white , fontFamily: "Audiowide"),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Please enter your phone number'
                              : null,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: _isRegistered ? null : () => _saveToFirestore(eventTitle),
          label: Text(_isRegistered ? 'Registered' : 'Register' , style: TextStyle(fontFamily: "Audiowide" ),),
          icon: Icon(_isRegistered ? Icons.check : Icons.save),
          backgroundColor: _isRegistered ? Colors.grey : Colors.blue,
        ),
      ),
    );
  }
}
