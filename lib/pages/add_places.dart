import 'package:flutter/material.dart';

class AddPlacesPage extends StatelessWidget {
  const AddPlacesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Add Places',
      home: DataAndImageInputScreen(),
    );
  }
}

class DataAndImageInputScreen extends StatefulWidget {
  @override
  _DataAndImageInputScreenState createState() =>
      _DataAndImageInputScreenState();
}

class _DataAndImageInputScreenState extends State<DataAndImageInputScreen> {
  TextEditingController _placeNameController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _uniqueAdventuresController = TextEditingController();
  String _placeName = '';
  String _location = '';
  String _description = '';
  String _adventures = '';
  String _imagePath = ''; // Store the image path here

  @override
  void dispose() {
    _placeNameController.dispose();
    _locationController.dispose();
    _descriptionController.dispose();
    _uniqueAdventuresController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _buildContent(), // Content of the screen
          _buildInterfaceName(), // Interface name
        ],
      ),
    );
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          // Place name as a keyboard input

          SizedBox(height: 80), //gap between topic and 1st input

          TextField(
            controller: _placeNameController,
            decoration: const InputDecoration(labelText: 'Enter Place Name'),
            onChanged: (value) {
              setState(() {
                _placeName = value;
              });
            },
          ),

          // Location as a keyboard input
          TextField(
            controller: _locationController,
            decoration: const InputDecoration(labelText: 'Enter Location'),
            onChanged: (value) {
              setState(() {
                _location = value;
              });
            },
          ),

          // Description as a keyboard input
          TextField(
            controller: _descriptionController,
            decoration: const InputDecoration(labelText: 'Enter Description'),
            onChanged: (value) {
              setState(() {
                _description = value;
              });
            },
          ),

          TextField(
            controller: _uniqueAdventuresController,
            decoration:
                const InputDecoration(labelText: 'Enter unique Adventures'),
            onChanged: (value) {
              setState(() {
                _adventures = value;
              });
            },
          ),

          SizedBox(height: 20.0),

          // Display the selected image
          _imagePath.isEmpty
              ? Text('No Image Selected')
              : Image.network(_imagePath),

          SizedBox(height: 10.0),

          ElevatedButton(
            onPressed: () {
              // Navigate to a screen for image selection
              // You can use packages like image_picker to select images
              // After selecting an image, set _imagePath with the selected image path
            },
            child: Text('Select Image'),
          ),

          SizedBox(height: 80.0),

          ElevatedButton(
            onPressed: () {
              // Perform actions with the entered data and image
              print('Place Name: $_placeName');
              print('Location: $_location');
              print('Description: $_description');
              print('Unique Adventures: $_adventures');
              print('Image Path: $_imagePath');
            },
            style: ElevatedButton.styleFrom(
              primary: Color(0xff00BFA5), // Set the background color here
            ),
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }

  Widget _buildInterfaceName() {
    return Container(
      alignment: Alignment.topCenter,
      padding:
          const EdgeInsets.only(top: 55.0), // Adjust the top padding as needed
      child: const Text(
        'Add Places', // Interface name
        style: TextStyle(
          fontSize: 20.0, // Customize the text size
          fontWeight: FontWeight.bold,
          color: Color(0xff00BFA5), // Customize the text weight
        ),
      ),
    );
    //SizedBox(height: 20); // Add a gap of 20 logical pixels
  }
}