//

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  late String _firstName;
  late String _lastName;
  late String _email;
  late String _password;
  late String _reEnterPassword;

  // Create a Firebase Auth instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Widget _buildTextField({
    required String hintText,
    required bool obscureText,
    required TextEditingController controller,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 1.0),
      child: TextFormField(
        style: const TextStyle(fontSize: 20.0, color: Colors.black),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          hintStyle: const TextStyle(color: Color.fromARGB(255, 61, 55, 55)),
          contentPadding:
              const EdgeInsets.only(left: 25.0, bottom: 10.0, top: 11.0),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
            borderRadius: BorderRadius.circular(25.7),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
            borderRadius: BorderRadius.circular(25.7),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
            borderRadius: BorderRadius.circular(25.7),
          ),
          suffixIcon: obscureText && hintText.contains('Password')
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  icon: Icon(
                    obscureText ? Icons.visibility : Icons.visibility_off,
                    color: Colors.black,
                  ),
                )
              : null,
        ),
        obscureText: obscureText,
        controller: controller,
      ),
    );
  }

  Widget _buildElevatedButtonField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: () {
            _signUp(); // Call the signup function
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.only(
              right: 50,
              left: 50,
              top: 6,
              bottom: 8,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          child: const Text(
            'Sign Up',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _signUp() async {
    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _email,
        password: _password,
      );

      // Sign up successful, you can perform actions here
      print('User signed up: ${userCredential.user?.email}');

      // After signing up, you can navigate to another screen if needed
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => const MyLogin()),
      // );
    } catch (e) {
      // Handle sign-up errors (e.g., email already exists, weak password, etc.)
      String errorMessage = 'Sign Up Error';
      if (e is FirebaseAuthException) {
        switch (e.code) {
          case 'email-already-in-use':
            errorMessage = 'Email is already in use.';
            break;
          case 'weak-password':
            errorMessage = 'Password is too weak.';
            break;
          case 'invalid-email':
            errorMessage = 'Invalid email address.';
            break;
          default:
            errorMessage = 'An error occurred while signing up.';
            break;
        }
      }

      // Show an error message to the user
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Sign Up Error'),
            content: Text(errorMessage),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );

      print('Sign Up Error: $errorMessage');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage("assets/illustration.png"),
                width: 250.0,
                alignment: Alignment.center,
              ),
              const SizedBox(height: 50),
              for (var label in [
                'First Name',
                'Last Name',
                'E-mail',
                'NIC',
                'Password',
                'Re-enter Password',
              ])
                _buildTextField(
                  hintText: label,
                  obscureText: label.contains('Password'),
                  controller: TextEditingController(),
                ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'By clicking ‘sign up’ I agree that I have read and accepted the',
                    style: TextStyle(color: Colors.black),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Terms of Use',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              _buildElevatedButtonField(),
            ],
          ),
        ),
      ),
    );
  }
}
