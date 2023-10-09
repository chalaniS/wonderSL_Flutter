import 'package:flutter/material.dart';
import 'package:wondersl/pages/User/login_page.dart';
import '../constants.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  Widget _buildEmailField() {
    return TextFormField(
      style:
          const TextStyle(fontSize: 20.0, color: Color.fromARGB(255, 0, 0, 0)),
      decoration: InputDecoration(
        filled: true,
        fillColor: Color.fromARGB(255, 255, 253, 253),
        hintText: 'example@gmail.com',
        hintStyle: const TextStyle(color: Colors.grey),
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
      ),
    );
  }

  Widget _buildElevatedButtonField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyLogin()),
            );
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.only(
              right: 50,
              left: 50,
              top: 6,
              bottom: 6,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          child: const Text(
            'Send',
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 25.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(35),
        child: Column(
          children: [
            const Text(
              'Enter the email associated with your account. \n\n\n Email address',
              style:
                  TextStyle(fontSize: 21, color: Color.fromARGB(255, 0, 0, 0)),
            ),
            _buildEmailField(),
            _buildElevatedButtonField(),
          ],
        ),
      ),
    );
  }
}
