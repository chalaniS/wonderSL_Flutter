import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wondersl/pages/update_places.dart';
import 'package:flutter/material.dart';

class PlacesListScreen extends StatefulWidget {
  @override
  _PlacesListScreenState createState() => _PlacesListScreenState();
}

class _PlacesListScreenState extends State<PlacesListScreen> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of Places'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 2, // Add elevation for a card-like appearance
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none, // Remove the border
                ),
                onChanged: (query) {
                  setState(() {
                    _searchQuery = query;
                  });
                },
              ),
            ),
          ),
          Expanded(
            child: PlacesList(searchQuery: _searchQuery),
          ),
        ],
      ),
    );
  }
}

class PlaceItem extends StatelessWidget {
  final String placeName;
  final String location;
  final String description;
  final String adventures;
  final String imagePath;
  final String documentId;

  PlaceItem({
    required this.placeName,
    required this.location,
    required this.description,
    required this.adventures,
    required this.imagePath,
    required this.documentId,
  });

  void deletePlace(String documentId) {
    FirebaseFirestore.instance.collection('places').doc(documentId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          title: Text('Place Name: $placeName'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Location: $location'),
              Text('Description: $description'),
              Text('Adventures: $adventures'),
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UpdatePlaceScreen(
                        placeName: placeName,
                        location: location,
                        description: description,
                        adventures: adventures,
                        imagePath: imagePath,
                        documentId: documentId,
                      ),
                    ),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Confirm Deletion'),
                        content: const Text(
                            'Are you sure you want to delete this place?'),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Cancel'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: const Text('Delete'),
                            onPressed: () {
                              deletePlace(documentId);
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlacesList extends StatelessWidget {
  final String searchQuery;

  PlacesList({required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('places').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final places = snapshot.data!.docs;

        return ListView.builder(
          itemCount: places.length,
          itemBuilder: (context, index) {
            var data = places[index].data() as Map<String, dynamic>;
            String placeName = data['placeName'];
            String location = data['location'];
            String description = data['description'];
            String adventures = data['adventures'];
            String imagePath = data['imagePath'];
            String documentId = places[index].id;

            // Filter places based on the search query
            if (placeName.toLowerCase().contains(searchQuery.toLowerCase())) {
              return PlaceItem(
                placeName: placeName,
                location: location,
                description: description,
                adventures: adventures,
                imagePath: imagePath,
                documentId: documentId,
              );
            } else {
              return Container(); // Return an empty container for non-matching items
            }
          },
        );
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PlacesListScreen(),
  ));
}
