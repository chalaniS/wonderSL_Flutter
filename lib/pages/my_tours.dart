import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wondersl/pages/DetailPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyTours(),
    );
  }
}

class TourData {
  final String documentId; // Add the documentId property
  final String tourName;
  final String tripCost;
  final String startDate;
  final String endDate;

  TourData({
    required this.documentId,
    required this.tourName,
    required this.tripCost,
    required this.startDate,
    required this.endDate,
  });
}

class MyTours extends StatefulWidget {
  const MyTours({Key? key}) : super(key: key);

  @override
  State<MyTours> createState() => _MyToursState();
}

class _MyToursState extends State<MyTours> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool? isCheckboxChecked;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'My Tours',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
          ),
        ),
      ),
      backgroundColor: Colors.grey[100],
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('tours').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // Show loading indicator while waiting for data
          }

          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Text('No tour data available.');
          }

          final tourDataList = snapshot.data!.docs.map((doc) {
            final data = doc.data() as Map<String, dynamic>;
            return TourData(
              documentId: doc.id,
              tourName: data['tour_name'],
              tripCost: data['other_expenses'].toString(),
              startDate: data['start_date'],
              endDate: data['end_date'],
            );
          }).toList();

          return ListView.builder(
            itemCount: tourDataList.length,
            itemBuilder: (context, index) {
              return TourItemWidget(
                tourData: tourDataList[index],
                isCheckboxChecked: isCheckboxChecked ?? false,
                onCheckboxChanged: (value) {
                  setState(() {
                    isCheckboxChecked = value;
                  });
                  print(value);
                },
              );
            },
          );
        },
      ),
    );
  }
}

class TourItemWidget extends StatelessWidget {
  final TourData tourData;
  final bool?
      isCheckboxChecked; // Declare isCheckboxChecked as nullable boolean
  final ValueChanged<bool?> onCheckboxChanged;

  TourItemWidget({
    required this.tourData,
    required this.isCheckboxChecked,
    required this.onCheckboxChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              documentId: tourData.documentId, // Include the document ID
              tourName: tourData.tourName,
              startDate: tourData.startDate,
              endDate: tourData.endDate,
              tripCost: tourData.tripCost,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0), // Adjust the padding as needed
        child: Container(
          width: double.infinity,
          height: 130,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                ),
                width: 20,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(tourData.tourName), // Display fetched data
                        subtitle: Text(
                            'Cost : ${tourData.tripCost}'), // Display fetched data
                        trailing: Transform.scale(
                          scale: 1.5,
                          child: Checkbox(
                            activeColor: isCheckboxChecked == true
                                ? Colors.amber
                                : Colors.green,
                            shape: const CircleBorder(),
                            value: isCheckboxChecked,
                            onChanged:
                                onCheckboxChanged, // Use the provided handler
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 1.5,
                        color: Colors.grey.shade200,
                      ),
                      Row(
                        children: [
                          Text(
                              'Starts: ${tourData.startDate}'), // Display fetched data
                          SizedBox(width: 20),
                          Text(
                              'Ends : ${tourData.endDate}'), // Display fetched data
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
 // Use
