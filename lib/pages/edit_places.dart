import 'package:flutter/material.dart';

class EditPlacePage extends StatelessWidget {
  final String initialPlaceName;
  final String initialLocation;
  final String initialDescription;
  final String initialAdventure;
  final String initialImagePath;

  EditPlacePage({
    required this.initialPlaceName,
    required this.initialLocation,
    required this.initialDescription,
    required this.initialAdventure,
    required this.initialImagePath,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController _placeNameController =
        TextEditingController(text: initialPlaceName);
    final TextEditingController _locationController =
        TextEditingController(text: initialLocation);
    final TextEditingController _descriptionController =
        TextEditingController(text: initialDescription);
    final TextEditingController _uniqueAdventuresController =
        TextEditingController(text: initialAdventure);

    String _placeName = initialPlaceName;
    String _location = initialLocation;
    String _description = initialDescription;
    String _adventures = initialAdventure;
    String _imagePath = initialImagePath;

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Place'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            // Place name input
            TextField(
              controller: _placeNameController,
              decoration: InputDecoration(labelText: 'Place Name'),
              onChanged: (value) {
                _placeName = value;
              },
            ),

            // Location input
            TextField(
              controller: _locationController,
              decoration: InputDecoration(labelText: 'Location'),
              onChanged: (value) {
                _location = value;
              },
            ),

            // Description input
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
              onChanged: (value) {
                _description = value;
              },
            ),

            TextField(
              controller: _uniqueAdventuresController,
              decoration: InputDecoration(labelText: 'Adventure'),
              onChanged: (value) {
                _adventures = value;
              },
            ),

            SizedBox(height: 20.0),

            // Display the selected image or a message
            _imagePath.isEmpty
                ? Text('No Image Selected')
                : Image.network(_imagePath),

            SizedBox(height: 20.0),

            // Button to select an image (you can reuse the image selection logic from the add screen)

            ElevatedButton(
              onPressed: () {
                // Navigate to a screen for image selection
                // You can use packages like image_picker to select images
                // After selecting an image, set _imagePath with the selected image path
              },
              child: Text('Select Image'),
            ),

            SizedBox(height: 20.0),

            // Button to submit the edited data
            ElevatedButton(
              onPressed: () {
                // Perform actions with the edited data and image
                print('Edited Place Name: $_placeName');
                print('Edited Location: $_location');
                print('Edited Description: $_description');
                print('Edited Adventure: $_adventures');
                print('Edited Image Path: $_imagePath');

                // You can update the data in your data storage or database here
              },
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[200], // Set background color
    );
  }
}

// 

// import 'package:flutter/material.dart';
// import 'add_places.dart';

// class EditPlaces extends StatelessWidget {
//   final Map<String, dynamic> Placesdata


//   Widget _buildInterfaceName() {
//     return Container(
//       alignment: Alignment.topCenter,
//       padding:
//           const EdgeInsets.only(top: 55.0), // Adjust the top padding as needed
//       child: const Text(
//         'Edit Places', // Interface name
//         style: TextStyle(
//           fontSize: 20.0, // Customize the text size
//           fontWeight: FontWeight.bold,
//           color: Color(0xff00BFA5), // Customize the text weight
//         ),
//       ),
//     );
//     //SizedBox(height: 20); // Add a gap of 20 logical pixels
//   }
// }