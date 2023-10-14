import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:wondersl/pages/adventures_page.dart';
import 'package:wondersl/pages/my_tours.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _formKey = GlobalKey<FormState>();

class ExpenseEntry {
  String name;
  String amount;

  ExpenseEntry(this.name, this.amount);
}

class TourPlanning extends StatefulWidget {
  final int subTotal;
  const TourPlanning({Key? key, required this.subTotal}) : super(key: key);

  @override
  State<TourPlanning> createState() => _TourPlanningState();
}

class _TourPlanningState extends State<TourPlanning> {
  String tour_name = "";
  int totalExpenses = 0;

  void initState() {
    super.initState();
    totalExpenses = widget.subTotal.toInt();
  }

  void getTourName(String tourname) {
    setState(() {
      tour_name = tourname;
    });
  }

  void calculateTotalExpenses() {
    int total = widget.subTotal;
    for (int i = 0; i < expenses.length; i++) {
      if (expenses[i].amount.isNotEmpty) {
        total += int.tryParse(expenses[i].amount) ?? 0;
      }
    }
    setState(() {
      totalExpenses = total;
    });
  }

  void addExpenseEntry() {
    setState(() {
      expenses.add(ExpenseEntry("", ""));
    });
  }

  void removeExpenseEntry(int index) {
    setState(() {
      expenses.removeAt(index);
    });
  }

  void cancelData() {
    print("Cancelled the tour");
  }

  Future<void> saveData() async {
    try {
      final CollectionReference tours =
          FirebaseFirestore.instance.collection('tours');

      await tours.add({
        'tour_name': tour_name,
        'start_date': _startDateController.text,
        'end_date': _endDateController.text,
        'expenses': expenses.map((entry) {
          return {'name': entry.name, 'amount': entry.amount};
        }).toList(),
        'other_expenses': totalExpenses,
      });

      print("Tour data saved successfully!");
    } catch (e) {
      print("Error saving tour data: $e");
    }
  }

  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  final DateFormat _dateFormat = DateFormat('dd/MM/yyyy');
  List<ExpenseEntry> expenses = [ExpenseEntry("", "")];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != DateTime.now()) {
      setState(() {
        _startDateController.text = _dateFormat.format(pickedDate);
      });
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != DateTime.now()) {
      setState(() {
        _endDateController.text = _dateFormat.format(pickedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'Create Tour',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Container(
                    margin: const EdgeInsets.all(24.0),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "Tour Name ",
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      const Color.fromARGB(255, 191, 240, 193),
                                  width: 2.0,
                                ),
                              ),
                            ),
                            onChanged: (String tourname) {
                              getTourName(tourname);
                            },
                            validator: (tourname) {
                              if (tourname == null || tourname.isEmpty) {
                                return 'Please enter Tour name';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: TextFormField(
                            readOnly: true,
                            controller: _startDateController,
                            onTap: () {
                              _selectDate(context);
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Select the Start Date';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: "Start Date",
                              hintText: 'Select date',
                              suffixIcon: Icon(Icons.calendar_today),
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      const Color.fromARGB(255, 191, 240, 193),
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: TextFormField(
                            readOnly: true,
                            controller: _endDateController,
                            onTap: () {
                              _selectEndDate(context);
                            },
                            decoration: InputDecoration(
                              labelText: "End date",
                              hintText: 'Select date',
                              suffixIcon: Icon(Icons.calendar_today),
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      const Color.fromARGB(255, 191, 240, 193),
                                  width: 2.0,
                                ),
                              ),
                            ),
                            validator: (value) {
                              DateTime? startDate =
                                  _dateFormat.parse(_startDateController.text);
                              DateTime? endDate =
                                  _dateFormat.parse(_endDateController.text);
                              if (startDate != null && endDate != null) {
                                if (endDate.isBefore(startDate)) {
                                  return "End date must be after Start date";
                                }
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                "Other Expenditures",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                              for (int index = 0;
                                  index < expenses.length;
                                  index++)
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        decoration:
                                            InputDecoration(labelText: 'Name'),
                                        onChanged: (value) {
                                          expenses[index].name = value;
                                        },
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          labelText: 'Amount',
                                        ),
                                        onChanged: (value) {
                                          expenses[index].amount = value;
                                          calculateTotalExpenses();
                                        },
                                        inputFormatters: [
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                        ],
                                      ),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.remove),
                                      onPressed: () {
                                        removeExpenseEntry(index);
                                      },
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            addExpenseEntry();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                tileColor: Color.fromARGB(255, 215, 240, 232),
                title: Text(
                  'Total trip cost : ${totalExpenses.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // ElevatedButton(
                //   onPressed: () {
                //     cancelData();
                //     Navigator.pushReplacement(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => const AdventuresPage(),
                //       ),
                //     );
                //   },
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: Colors.grey,
                //   ),
                //   child: Text("Cancel"),
                // ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      calculateTotalExpenses();
                      saveData();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyTours(),
                        ),
                      );
                    }
                  },
                  child: Text("Save"),
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
