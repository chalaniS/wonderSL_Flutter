import 'package:flutter/material.dart';
//import 'package:wondersl/models/budget_plan.dart';
import 'package:wondersl/pages/tour_plan.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdventuresPage extends StatefulWidget {
  final int transportCost;

  AdventuresPage({required this.transportCost, Key? key}) : super(key: key);

  @override
  _AdventuresPageState createState() => _AdventuresPageState();
}

class _AdventuresPageState extends State<AdventuresPage> {
  int count = 1;

  // budget budgetdata = budget(
  //     vehicle_type: '',
  //     travellers_count: 1,
  //     selectedAdventures: [],
  //     //subTotal: 0
  //     );

  // Define a list of adventures with their details
  final List<Map<String, String>> adventures = [
    {'name': 'Water Rafting & Tubing', 'cost': '2000'},
    {'name': 'Stream Sliding', 'cost': '2300'},
    {'name': 'Rock Jumping', 'cost': '1800'},
    {'name': 'Trekking', 'cost': '1500'},
    {'name': 'Zip lining', 'cost': '2700'},
  ];

  // Maintain a list of boolean values to track checkbox states
  List<bool> adventureSelectedStates = List.generate(5, (index) => false);
  int subTotal = 0; // Initializing subTotal

  // Calculate the total cost per person
  int calculateTotalPerPerson() {
    int totalCost = 0;
    for (int i = 0; i < adventures.length; i++) {
      if (adventureSelectedStates[i]) {
        totalCost += int.parse(adventures[i]['cost'] ?? '0');
      }
    }
    return totalCost;
  }

  // void saveData(budget budgetdata) async {
  //   try {
  //     await FirebaseFirestore.instance
  //         .collection('tours')
  //         .add(budgetdata.toMap());
  //     int subTotal = (calculateTotalPerPerson() * count) + widget.transportCost;

  //     List<Map<String, String>> selectedAdventures = [];
  //     for (int i = 0; i < adventures.length; i++) {
  //       if (adventureSelectedStates[i]) {
  //         selectedAdventures.add({
  //           'name': adventures[i]['name'] ?? '',
  //           'cost': adventures[i]['cost'] ?? '',
  //         });
  //       }
  //     }

  //     print("adventure data saved successfully!");
  //   } catch (e) {
  //     print("Error saving tour data: $e");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    int totalPerPerson = calculateTotalPerPerson();
    int calculatedSubTotal =
        (calculateTotalPerPerson() * count) + widget.transportCost;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Adventures',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        // Adjust the padding as needed
        child: Column(
          children: [
            for (int i = 0; i < adventures.length; i++)
              Container(
                width: double.infinity,
                height: 75,
                decoration: BoxDecoration(
                  color: Colors.white,
                  //borderRadius: BorderRadius.circular(12),
                ),
                child: GestureDetector(
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                title: Text(
                                  adventures[i]['name'] ?? '',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                    'Cost : Rs. ${adventures[i]['cost'] ?? ''}'),
                                trailing: Transform.scale(
                                  scale: 1.5,
                                  child: Checkbox(
                                    activeColor: Colors.blue,
                                    value: adventureSelectedStates[i],
                                    onChanged: (value) {
                                      setState(() {
                                        adventureSelectedStates[i] =
                                            value ?? false;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            SizedBox(
              height: 12, // Adjust this value to control the space
            ),
            Expanded(
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.end, // Align components to the bottom
                children: [
                  Container(
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      tileColor: Colors.white,
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'No. of travelers : ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.remove),
                                onPressed: () {
                                  // Decrease the count, but don't go below 1
                                  if (count > 1) {
                                    setState(() {
                                      count--;
                                    });
                                  }
                                },
                              ),
                              Text(
                                count.toString(), // Display the count
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {
                                  // Increase the count
                                  setState(() {
                                    count++;
                                  });
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                'Cost Per Person: Rs. $totalPerPerson',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height:
                                20, // Adjust this value to control the space
                          ),
                          Row(
                            children: [
                              Text(
                                'Total cost : Rs. ${totalPerPerson * count}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height:
                                20, // Adjust this value to control the space
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      tileColor: Color.fromARGB(255, 215, 240, 232),
                      title: Text(
                        'Sub Total : $calculatedSubTotal',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal:
                            16), // Adjust the horizontal padding as needed
                    child: Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          //saveData(budgetdata);

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  TourPlanning(subTotal: calculatedSubTotal),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shape: StadiumBorder(),
                          padding: EdgeInsets.all(10),
                        ),
                        child: Text(
                          'Plan this tour ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
