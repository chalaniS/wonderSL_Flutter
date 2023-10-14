import 'package:flutter/material.dart';
import 'package:wondersl/pages/home_page.dart';

final _formKey = GlobalKey<FormState>();

class UserPreferences extends StatefulWidget {
  const UserPreferences({super.key});

  @override
  State<UserPreferences> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<UserPreferences> {
  String dropdownValue = "Beach";
  String dropdownValue_season = "Summer";
  String dropdownValue_style = "Adventure";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                'Where Shall We Go ?',
                style: TextStyle(
                  fontSize: 30,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Text(
                'Get Started!',
                style: TextStyle(
                    fontSize: 30, color: Theme.of(context).colorScheme.primary),
              ),
              SizedBox(height: 40),
              Row(
                children: [
                  Text(
                    'Destination : ',
                    style: TextStyle(
                      color: Colors.black, // Text color
                      fontSize: 20, // Font size
                      fontWeight: FontWeight.bold, // Text weight
                    ),
                  ),
                  SizedBox(width: 20),
                  DropdownButton<String>(
                    value: dropdownValue,
                    icon: const Icon(Icons.arrow_drop_down),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: const [
                      'Beach',
                      'Mountains',
                      'Cities',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                            color: Colors.black, // Text color
                            fontSize: 20, // Font size
                            //fontWeight: FontWeight.bold, // Text weight
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    'Season : ',
                    style: TextStyle(
                      color: Colors.black, // Text color
                      fontSize: 20, // Font size
                      fontWeight: FontWeight.bold, // Text weight
                    ),
                  ),
                  SizedBox(width: 60),
                  DropdownButton<String>(
                    value: dropdownValue_season,
                    icon: const Icon(Icons.arrow_drop_down),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue_season = newValue!;
                      });
                    },
                    items: const [
                      'Summer',
                      'Spring',
                      'Fall',
                      'Winter',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                            color: Colors.black, // Text color
                            fontSize: 20, // Font size
                            //fontWeight: FontWeight.bold, // Text weight
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
              Row(
                children: [
                  Text(
                    'Travel Style : ',
                    style: TextStyle(
                      color: Colors.black, // Text color
                      fontSize: 20, // Font size
                      fontWeight: FontWeight.bold, // Text weight
                    ),
                  ),
                  SizedBox(width: 20),
                  DropdownButton<String>(
                    value: dropdownValue_style,
                    icon: const Icon(Icons.arrow_drop_down),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue_style = newValue!;
                      });
                    },
                    items: const [
                      'Adventure',
                      'Relaxation',
                      'Cultural',
                      'Wildlife',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                            color: Colors.black, // Text color
                            fontSize: 20, // Font size
                            //fontWeight: FontWeight.bold, // Text weight
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                child: Container(
                  child: Image.asset(
                    'assets/letsGo.gif',
                    width: 180,
                    height: 180,
                  ),
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
                                builder: (context) => HomePage(),
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
                            "Let's Go",
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
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
