import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:wondersl/pages/User/profile_page.dart';

class EditProfile extends StatefulWidget {
  final Map<String, dynamic> userData;

  EditProfile({required this.userData});

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  late String _firstName;
  late String _lastName;
  late String _email;
  late String _nic;

  late DatabaseReference _databaseReference;

  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _nicController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _firstNameController.text = widget.userData['firstName'] ?? '';
    _lastNameController.text = widget.userData['lastName'] ?? '';
    _nicController.text = widget.userData['nic'] ?? '';
    _emailController.text = widget.userData['email'] ?? '';

    // Initialize the Firebase Database reference
    _databaseReference = FirebaseDatabase.instance.reference().child('users');
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _nicController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _saveChanges() {
    // You can access the updated values using the controller.text properties.
    final updatedFirstName = _firstNameController.text;
    final updatedLastName = _lastNameController.text;
    final updatedEmail = _emailController.text;
    final updatedNic = _nicController.text;

    // Get the current user's UID
    final userUid = _auth.currentUser?.uid;

    if (userUid != null) {
      // Update the user's information in Firebase Database
      _databaseReference.child(userUid).update({
        'firstName': updatedFirstName,
        'lastName': updatedLastName,
        'email': updatedEmail,
        'nic': updatedNic,
      }).then((_) {
        // // Show a success message or navigate back to the profile screen
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(
        //     content: Text('Profile updated successfully'),
        //   ),
        // );

        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Successfull!'),
              content: const Text('You have successfully Edit your Profile..'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  Profile()),
                    );
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }).catchError((error) {
        // Handle errors, e.g., display an error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error updating profile: $error'),
          ),
        );
      });
    }
  }

  Widget _buildTextField({
    required String hintText,
    required bool obscureText,
    required TextEditingController controller,
    required String label,
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
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
        onSaved: (value) {
          if (label == 'First Name') {
            _firstName = value!;
          } else if (label == 'Last Name') {
            _lastName = value!;
          } else if (label == 'E-mail') {
            _email = value!;
          } else if (label == 'NIC') {
            _nic = value!;
          }
        },
      ),
    );
  }

  Widget _buildElevatedButtonField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: _saveChanges,
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
            'Submit',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _firstNameController,
              decoration: InputDecoration(labelText: 'First Name',),
            ),
            TextFormField(
              controller: _lastNameController,
              decoration: InputDecoration(labelText: 'Last Name',),
            ),
            TextFormField(
              controller: _nicController,
              decoration: InputDecoration(labelText: 'NIC',),
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email Address',),
            ),
            _buildElevatedButtonField(),
          ],
        ),
      ),
    );
  }
}
