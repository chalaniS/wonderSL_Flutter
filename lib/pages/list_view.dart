// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:wondersl/pages/update_places.dart';
// import 'package:flutter/material.dart';

// class PlacesListScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('List of Places'),
//       ),
//       body: PlacesList(),
//     );
//   }
// }

// // class PlaceItem extends StatelessWidget {
// //   final String placeName;
// //   final String location;
// //   final String description;
// //   final String adventures;
// //   final String imagePath;

// //   PlaceItem({
// //     required this.placeName,
// //     required this.location,
// //     required this.description,
// //     required this.adventures,
// //     required this.imagePath,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return Padding(
// //       padding: const EdgeInsets.all(8.0), // Add gap between records
// //       child: Card(
// //         child: ListTile(
// //           title: Text('Place Name: $placeName'),
// //           subtitle: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               Text('Location: $location'),
// //               Text('Description: $description'),
// //               Text('Adventures: $adventures'),
// //             ],
// //           ),
// //           trailing: Image.network(imagePath),
// //           onTap: () {
// //             // Navigate to the update screen with the current place details
// //             Navigator.push(
// //               context,
// //               MaterialPageRoute(
// //                 builder: (context) => UpdatePlaceScreen(
// //                   placeName: placeName,
// //                   location: location,
// //                   description: description,
// //                   adventures: adventures,
// //                   imagePath: imagePath,
// //                   documentId: '',
// //                 ),
// //               ),
// //             );
// //           },
// //         ),
// //       ),
// //     );
// //   }
// // }
// class PlaceItem extends StatelessWidget {
//   final String placeName;
//   final String location;
//   final String description;
//   final String adventures;
//   final String imagePath;
//   final String documentId;

//   PlaceItem({
//     required this.placeName,
//     required this.location,
//     required this.description,
//     required this.adventures,
//     required this.imagePath,
//     required this.documentId,
//   });

//   @override
//   Widget build(BuildContext context) {
//     void deletePlace(String documentId) {
//       FirebaseFirestore.instance.collection('places').doc(documentId).delete();
//     }

//     return Padding(
//       padding: const EdgeInsets.all(8.0), // Add gap between records
//       child: Card(
//         child: ListTile(
//           title: Text('Place Name: $placeName'),
//           subtitle: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text('Location: $location'),
//               Text('Description: $description'),
//               Text('Adventures: $adventures'),
//             ],
//           ),
//           trailing: Image.network(imagePath),
//           onTap: () {
//             // Navigate to the update screen with the current place details
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => UpdatePlaceScreen(
//                   placeName: placeName,
//                   location: location,
//                   description: description,
//                   adventures: adventures,
//                   imagePath: imagePath,
//                   documentId: documentId,
//                 ),
//               ),
//             );
//           },
//           contentPadding: EdgeInsets.all(16),
//           isThreeLine: true,
//           dense: true,
//           // Add update and delete buttons
//           leading: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               IconButton(
//                 icon: Icon(Icons.edit),
//                 onPressed: () {
//                   // Navigate to the update screen with the current place details
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => UpdatePlaceScreen(
//                         placeName: placeName,
//                         location: location,
//                         description: description,
//                         adventures: adventures,
//                         imagePath: imagePath,
//                         documentId: documentId,
//                       ),
//                     ),
//                   );
//                 },
//               ),
//               IconButton(
//                 icon: Icon(Icons.delete),
//                 onPressed: () {
//                   showDialog(
//                     context: context,
//                     builder: (BuildContext context) {
//                       return AlertDialog(
//                         title: Text('Confirm Deletion'),
//                         content:
//                             Text('Are you sure you want to delete this place?'),
//                         actions: <Widget>[
//                           TextButton(
//                             child: Text('Cancel'),
//                             onPressed: () {
//                               Navigator.of(context).pop();
//                             },
//                           ),
//                           TextButton(
//                             child: Text('Delete'),
//                             onPressed: () {
//                               // Implement the delete logic here
//                               deletePlace(documentId);
//                               Navigator.of(context).pop();
//                             },
//                           ),
//                         ],
//                       );
//                     },
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class PlacesList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance.collection('places').snapshots(),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         }

//         final places = snapshot.data!.docs;

//         return ListView.builder(
//           itemCount: places.length,
//           itemBuilder: (context, index) {
//             var data = places[index].data() as Map<String, dynamic>;
//             String placeName = data['placeName'];
//             String location = data['location'];
//             String description = data['description'];
//             String adventures = data['adventures'];
//             String imagePath = data['imagePath'];

//             return PlaceItem(
//               placeName: placeName,
//               location: location,
//               description: description,
//               adventures: adventures,
//               imagePath: imagePath,
//               documentId: '',
//             );
//           },
//         );
//       },
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wondersl/pages/update_places.dart';
import 'package:flutter/material.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Places'),
      ),
      body: PlacesList(),
    );
  }
}

// class PlaceItem extends StatelessWidget {
//   final String placeName;
//   final String location;
//   final String description;
//   final String adventures;
//   final String imagePath;
//   final String documentId;

//   PlaceItem({
//     required this.placeName,
//     required this.location,
//     required this.description,
//     required this.adventures,
//     required this.imagePath,
//     required this.documentId,
//   });

// void deletePlace(String documentId) {
//   FirebaseFirestore.instance.collection('places').doc(documentId).delete();
// }

// @override
// Widget build(BuildContext context) {
//   return Padding(
// padding: const EdgeInsets.all(8.0),
// child: Card(
//   child: ListTile(
//     title: Text('Place Name: $placeName'),
//     subtitle: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text('Location: $location'),
//         Text('Description: $description'),
//         Text('Adventures: $adventures'),
//       ],
//     ),
//     trailing: Image.network(imagePath),
//     onTap: () {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//       builder: (context) => UpdatePlaceScreen(
//         placeName: placeName,
//         location: location,
//         description: description,
//         adventures: adventures,
//         imagePath: imagePath,
//         documentId: documentId,
//       ),
//     ),
//   );
// },
// onLongPress: () {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text('Confirm Deletion'),
//         content: Text('Are you sure you want to delete this place?'),
//         actions: <Widget>[
//           TextButton(
//             child: Text('Cancel'),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//           TextButton(
//             child: Text('Delete'),
//             onPressed: () {
//               deletePlace(documentId);
//                         Navigator.of(context).pop();
//                       },
//                     ),
//                   ],
//                 );
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

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
                        title: Text('Confirm Deletion'),
                        content:
                            Text('Are you sure you want to delete this place?'),
                        actions: <Widget>[
                          TextButton(
                            child: Text('Cancel'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: Text('Delete'),
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
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('places').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
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

            return PlaceItem(
              placeName: placeName,
              location: location,
              description: description,
              adventures: adventures,
              imagePath: imagePath,
              documentId: documentId,
            );
          },
        );
      },
    );
  }
}
