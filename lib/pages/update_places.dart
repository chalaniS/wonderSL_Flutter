// // // update_place.dart

// // // Imports and boilerplate code
// // import 'package:flutter/material.dart';

// // class UpdatePlaceScreen extends StatefulWidget {
// //   final String placeName;
// //   final String location;
// //   final String description;
// //   final String adventures;
// //   final String imagePath;

// //   UpdatePlaceScreen({
// //     required this.placeName,
// //     required this.location,
// //     required this.description,
// //     required this.adventures,
// //     required this.imagePath,
// //   });

// //   @override
// //   _UpdatePlaceScreenState createState() => _UpdatePlaceScreenState();
// // }

// // class _UpdatePlaceScreenState extends State<UpdatePlaceScreen> {
// //   // Add controllers and variables for editing the values

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Update Place'),
// //       ),
// //       body: _buildUpdateContent(),
// //     );
// //   }

// //   Widget _buildUpdateContent() {
// //     // Use controllers and variables to populate the input fields with current values.
// //     return SingleChildScrollView(
// //       padding: EdgeInsets.all(16.0),
// //       child: Column(
// //         children: <Widget>[
// //           // Place name as a keyboard input
// //           TextField(
// //               // Use _placeNameController and set its initial text to widget.placeName
// //               ),
// //           // Location as a keyboard input
// //           TextField(
// //               // Use _locationController and set its initial text to widget.location
// //               ),
// //           // Description as a keyboard input
// //           TextField(
// //               // Use _descriptionController and set its initial text to widget.description
// //               ),
// //           TextField(
// //               // Use _uniqueAdventuresController and set its initial text to widget.adventures
// //               ),
// //           // Display the selected image
// //           widget.imagePath.isEmpty
// //               ? Text('No Image Selected')
// //               : Image.network(widget.imagePath),
// //           SizedBox(height: 10.0),
// //           ElevatedButton(
// //             onPressed: () {
// //               // Implement logic for updating the place here
// //             },
// //             child: Text('Update Place'),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';

// class UpdatePlaceScreen extends StatefulWidget {
//   final String placeName;
//   final String location;
//   final String description;
//   final String adventures;
//   final String imagePath;

//   UpdatePlaceScreen({
//     required this.placeName,
//     required this.location,
//     required this.description,
//     required this.adventures,
//     required this.imagePath,
//   });

//   @override
//   _UpdatePlaceScreenState createState() => _UpdatePlaceScreenState();
// }

// class _UpdatePlaceScreenState extends State<UpdatePlaceScreen> {
//   TextEditingController _placeNameController = TextEditingController();
//   TextEditingController _locationController = TextEditingController();
//   TextEditingController _descriptionController = TextEditingController();
//   TextEditingController _uniqueAdventuresController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     // Initialize text controllers with current values
//     _placeNameController.text = widget.placeName;
//     _locationController.text = widget.location;
//     _descriptionController.text = widget.description;
//     _uniqueAdventuresController.text = widget.adventures;
//   }

//   @override
//   void dispose() {
//     _placeNameController.dispose();
//     _locationController.dispose();
//     _descriptionController.dispose();
//     _uniqueAdventuresController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Update Place'),
//       ),
//       body: _buildUpdateContent(),
//     );
//   }

//   Widget _buildUpdateContent() {
//     return SingleChildScrollView(
//       padding: EdgeInsets.all(16.0),
//       child: Column(
//         children: <Widget>[
//           // Place name as a keyboard input
//           TextField(
//             controller: _placeNameController,
//             decoration: InputDecoration(
//               labelText: 'Enter Place Name',
//               hintText: 'Current: ${widget.placeName}',
//             ),
//           ),
//           // Location as a keyboard input
//           TextField(
//             controller: _locationController,
//             decoration: InputDecoration(
//               labelText: 'Enter Location',
//               hintText: 'Current: ${widget.location}',
//             ),
//           ),
//           // Description as a keyboard input
//           TextField(
//             controller: _descriptionController,
//             decoration: InputDecoration(
//               labelText: 'Enter Description',
//               hintText: 'Current: ${widget.description}',
//             ),
//           ),
//           TextField(
//             controller: _uniqueAdventuresController,
//             decoration: InputDecoration(
//               labelText: 'Enter unique Adventures',
//               hintText: 'Current: ${widget.adventures}',
//             ),
//           ),
//           // Display the selected image
//           widget.imagePath.isEmpty
//               ? Text('No Image Selected')
//               : Image.network(widget.imagePath),
//           SizedBox(height: 10.0),
//           ElevatedButton(
//             onPressed: () {
//               // Implement logic for updating the place here
//               // You can access the updated values using _placeNameController.text, _locationController.text, etc.
//             },
//             child: Text('Update Place'),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class UpdatePlaceScreen extends StatefulWidget {
//   final String placeName;
//   final String location;
//   final String description;
//   final String adventures;
//   final String imagePath;

//   UpdatePlaceScreen({
//     required this.placeName,
//     required this.location,
//     required this.description,
//     required this.adventures,
//     required this.imagePath,
//   });

//   @override
//   _UpdatePlaceScreenState createState() => _UpdatePlaceScreenState();
// }

// class _UpdatePlaceScreenState extends State<UpdatePlaceScreen> {
//   TextEditingController _placeNameController = TextEditingController();
//   TextEditingController _locationController = TextEditingController();
//   TextEditingController _descriptionController = TextEditingController();
//   TextEditingController _adventuresController = TextEditingController();
//   String _imagePath = '';

//   @override
//   void initState() {
//     super.initState();
//     // Initialize the text fields with the existing data
//     _placeNameController.text = widget.placeName;
//     _locationController.text = widget.location;
//     _descriptionController.text = widget.description;
//     _adventuresController.text = widget.adventures;
//     _imagePath = widget.imagePath;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Edit Place'),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: <Widget>[
//             // Place name as a keyboard input
//             TextField(
//               controller: _placeNameController,
//               decoration: const InputDecoration(labelText: 'Enter Place Name'),
//             ),

//             // Location as a keyboard input
//             TextField(
//               controller: _locationController,
//               decoration: const InputDecoration(labelText: 'Enter Location'),
//             ),

//             // Description as a keyboard input
//             TextField(
//               controller: _descriptionController,
//               decoration: const InputDecoration(labelText: 'Enter Description'),
//             ),

//             TextField(
//               controller: _adventuresController,
//               decoration:
//                   const InputDecoration(labelText: 'Enter unique Adventures'),
//             ),

//             SizedBox(height: 20.0),

//             // Display the selected image
//             _imagePath.isEmpty
//                 ? Text('No Image Selected')
//                 : Image.network(_imagePath),

//             SizedBox(height: 10.0),

//             ElevatedButton(
//               onPressed: () {
//                 // Implement image selection and update _imagePath
//                 // You can use packages like image_picker to select images
//               },
//               child: Text('Select Image'),
//             ),

//             SizedBox(height: 20.0),

//             ElevatedButton(
//               onPressed: () {
//                 // Perform actions with the entered data and image
//                 final updatedPlaceName = _placeNameController.text;
//                 final updatedLocation = _locationController.text;
//                 final updatedDescription = _descriptionController.text;
//                 final updatedAdventures = _adventuresController.text;
//                 final updatedImagePath = _imagePath;

//                 // You can update the record in Firestore with the updated data
//                 // Implement your Firestore update logic here

//                 // Once updated, you might want to navigate back to the previous screen
//                 Navigator.pop(context);
//               },
//               style: ElevatedButton.styleFrom(
//                 primary: Color(0xff00BFA5), // Set the background color here
//               ),
//               child: const Text('Save'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore

class UpdatePlaceScreen extends StatefulWidget {
  final String placeName;
  final String location;
  final String description;
  final String adventures;
  final String imagePath;
  final String documentId; // Include the document ID for updating

  UpdatePlaceScreen({
    required this.placeName,
    required this.location,
    required this.description,
    required this.adventures,
    required this.imagePath,
    required this.documentId, // Pass the document ID
  });

  @override
  _UpdatePlaceScreenState createState() => _UpdatePlaceScreenState();
}

class _UpdatePlaceScreenState extends State<UpdatePlaceScreen> {
  TextEditingController _placeNameController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _adventuresController = TextEditingController();
  String _imagePath = '';

  @override
  void initState() {
    super.initState();
    _placeNameController.text = widget.placeName;
    _locationController.text = widget.location;
    _descriptionController.text = widget.description;
    _adventuresController.text = widget.adventures;
    _imagePath = widget.imagePath;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Place'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            // Place name as a keyboard input
            TextField(
              controller: _placeNameController,
              decoration: const InputDecoration(labelText: 'Enter Place Name'),
            ),

            // Location as a keyboard input
            TextField(
              controller: _locationController,
              decoration: const InputDecoration(labelText: 'Enter Location'),
            ),

            // Description as a keyboard input
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Enter Description'),
            ),

            TextField(
              controller: _adventuresController,
              decoration:
                  const InputDecoration(labelText: 'Enter unique Adventures'),
            ),

            SizedBox(height: 20.0),

            // Display the selected image
            _imagePath.isEmpty
                ? Text('No Image Selected')
                : Image.network(_imagePath),

            SizedBox(height: 10.0),

            ElevatedButton(
              onPressed: () {
                // Implement image selection and update _imagePath
                // You can use packages like image_picker to select images
              },
              child: Text('Select Image'),
            ),

            SizedBox(height: 20.0),

            ElevatedButton(
              onPressed: () {
                // Get the updated data
                final updatedPlaceName = _placeNameController.text;
                final updatedLocation = _locationController.text;
                final updatedDescription = _descriptionController.text;
                final updatedAdventures = _adventuresController.text;
                final updatedImagePath = _imagePath;

                // Get the Firestore document reference
                final documentReference = FirebaseFirestore.instance
                    .collection('places')
                    .doc(widget.documentId); // Use the provided document ID

                // Prepare the data to be updated
                final updatedData = {
                  'placeName': updatedPlaceName,
                  'location': updatedLocation,
                  'description': updatedDescription,
                  'adventures': updatedAdventures,
                  'imagePath': updatedImagePath,
                };

                // Update the Firestore document
                documentReference.update(updatedData);

                // Navigate back to the previous screen
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xff00BFA5), // Set the background color here
              ),
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
