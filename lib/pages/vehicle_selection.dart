import 'package:flutter/material.dart';
import 'package:wondersl/pages/adventures_page.dart';
import 'package:wondersl/widgets/distance.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VehicleSelection extends StatefulWidget {
  const VehicleSelection({super.key});

  @override
  State<VehicleSelection> createState() => _VehicleSelectionState();
}

class _VehicleSelectionState extends State<VehicleSelection> {
  String dropdownValue = 'Bus';
  String distance = '0.00';
  int transportCost = 0;

  void fetchLocation() async {
    try {
      final QuerySnapshot locationSnapshot = await FirebaseFirestore.instance
          .collection('Location')
          .orderBy('timestamp',
              descending: true) // Order by timestamp in descending order
          .limit(1) // Limit the result to one document (the latest)
          .get();

      if (locationSnapshot.docs.isNotEmpty) {
        final latestLocationDocument = locationSnapshot.docs.first;
        final data = latestLocationDocument.data() as Map<String, dynamic>;
        if (data.containsKey('total_distance')) {
          final locationDistance = data['total_distance'];
          if (locationDistance is double) {
            final formattedDistance = locationDistance.toStringAsFixed(2);
            final distanceDouble = double.parse(formattedDistance);
            final distanceInt = distanceDouble.toInt();
            setState(() {
              distance = distanceInt.toString();
              print(distance);
            });
          }
        }
      } else {
        print("No Location documents found.");
      }
    } catch (e) {
      print("Error fetching latest location: $e");
    }
  }

  int calTransportCost() {
    int transportCost = 0;
    int vehicleFare = 0;
    if (dropdownValue == 'Bus') {
      vehicleFare = 150;
    } else if (dropdownValue == 'Car') {
      vehicleFare = 100;
    } else if (dropdownValue == 'Motor Bike') {
      vehicleFare = 30;
    } else {
      vehicleFare = 120;
    }
    transportCost = vehicleFare * int.parse(distance);
    print(vehicleFare);
    print('transportCost');
    return transportCost;
  }

  @override
  void initState() {
    super.initState();

    fetchLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'Transportation Details',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 175,
            ),
            Text(
              "Distance : $distance km",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Vehicle : ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_drop_down),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                      transportCost = calTransportCost();
                    });
                  },
                  items: const [
                    'Bus',
                    'Car',
                    'Motor Bike',
                    'Van',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                          color: Colors.black, // Text color
                          fontSize: 20, // Font size
                          fontWeight: FontWeight.bold, // Text weight
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Transportation cost : Rs. ${transportCost}',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Image.asset(
                'assets/Vehicle/driving-gif.gif',
                width: 280, // Set the width you want
                height: 280,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  AdventuresPage(transportCost: transportCost),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shape: const StadiumBorder(),
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 100.0,
                          ),
                        ),
                        child: const Text(
                          "Continue",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
