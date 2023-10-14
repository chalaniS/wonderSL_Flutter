import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ExpenseEntry {
  String name;
  String amount;

  ExpenseEntry(this.name, this.amount);
}

class DetailPage extends StatefulWidget {
  final String documentId; // Include the document ID
  final String tourName;
  final String startDate;
  final String endDate;
  final String tripCost;

  DetailPage({
    required this.documentId,
    required this.tourName,
    required this.startDate,
    required this.endDate,
    required this.tripCost,
  });

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List<ExpenseEntry> expenses = [];
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  // Future<int> fetchTravelCount() async {
  //   try {
  //     final DocumentSnapshot adventureDocument = await FirebaseFirestore
  //         .instance
  //         .collection('adventure_selection')
  //         .doc(widget.documentId)
  //         .get();

  //     if (adventureDocument.exists) {
  //       final data = adventureDocument.data() as Map<String, dynamic>;
  //       final travelerCount = data['travellers_count'] as int;
  //       return travelerCount;
  //     }
  //   } catch (e) {
  //     print("Error fetching traveler count: $e");
  //   }
  //   return 0;
  // }

  void fetchExpenses() async {
    try {
      final DocumentSnapshot tourDocument = await FirebaseFirestore.instance
          .collection('tours')
          .doc(widget.documentId)
          .get();

      if (tourDocument.exists) {
        final data = tourDocument.data() as Map<String, dynamic>;
        ;
        final expensesData = data['expenses'] as List<dynamic>;

        expenses = expensesData
            .map((entry) => ExpenseEntry(
                entry['name'] as String, entry['amount'] as String))
            .toList();
      }
    } catch (e) {
      print("Error fetching Expenses : $e");
    }
  }

  int travelerCount = 0;
  @override
  void initState() {
    super.initState();
    startDateController.text = widget.startDate;
    endDateController.text = widget.endDate;
    fetchExpenses();
    // fetchTravelCount().then((count) {
    //   setState(() {
    //     travelerCount = count;
    //   });
    // });
  }

  void updateDates() async {
    try {
      await FirebaseFirestore.instance
          .collection('tours')
          .doc(widget.documentId)
          .update({
        'start_date': startDateController.text,
        'end_date': endDateController.text,
      });

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Dates updated successfully.'),
      ));
    } catch (e) {
      print("Error updating dates: $e");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error updating dates. Please try again.'),
      ));
    }
  }

  void deleteTour() async {
    try {
      await FirebaseFirestore.instance
          .collection('tours')
          .doc(widget.documentId)
          .delete();

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Tour deleted successfully.'),
      ));

      // After deleting, you can navigate back to the previous page or any other desired action.
      // For example:
      Navigator.pop(context);
    } catch (e) {
      print("Error deleting tour: $e");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error deleting tour. Please try again.'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          widget.tourName,
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
          ),
        ),
      ),
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    'Start Date: ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: startDateController,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    'End Date: ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: TextFormField(
                      controller: endDateController,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Row(
              //   children: [
              //     Text(
              //       'Travellers count : ',
              //       style: TextStyle(
              //         fontSize: 20,
              //         fontWeight: FontWeight.w600,
              //       ),
              //     ),
              //     SizedBox(width: 10),
              //     Text(
              //       '$travelerCount',
              //       style: TextStyle(
              //         fontSize: 20,
              //         // fontWeight: FontWeight.w600,
              //       ),
              //     ),
              //   ],
              // ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'Total Trip Cost :',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 20),
                  Text(
                    widget.tripCost,
                    style: TextStyle(
                      fontSize: 20,
                      // fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ExpansionTile(
                title: Text(
                  'Expenses List',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                children: [
                  SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: expenses.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Text(
                            expenses[index].name,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            expenses[index].amount,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
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
                            updateDates(); // Call the function to update dates
                          },
                          child: Text("Update Dates"),
                        ),
                        SizedBox(width: 40),
                        ElevatedButton(
                          onPressed: () {
                            deleteTour(); // Call the function to update dates
                          },
                          child: Text("Delete"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
