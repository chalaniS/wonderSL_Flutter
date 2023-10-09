import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _database = FirebaseDatabase.instance.reference();
  Map<String, dynamic> userData = {};

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    final User? user = _auth.currentUser;
    final String? userId = user?.uid;

    // Use DatabaseEvent instead of DataSnapshot here
    DatabaseEvent snapshot =
        await _database.child('users').child(userId!).once();

    // Use `as` to cast `Object?` to `Map<dynamic, dynamic>`
    Map<dynamic, dynamic>? snapshotValue = snapshot.snapshot.value as Map<dynamic, dynamic>?;

    if (snapshotValue != null) {
      setState(() {
        userData = Map<String, dynamic>.from(snapshotValue);
      });
    }

  }

  Future<String?> _fetchNIC() async {
    final User? user = _auth.currentUser;
    final String? userId = user?.uid;

    // Use DatabaseEvent instead of DataSnapshot here
    DatabaseEvent snapshot =
    await _database.child('users').child(userId!).child('nic').once();

    // Return the NIC as a string
    return snapshot.snapshot.value as String?;
  }

  Future<String?> _fetchEmail() async {
    final User? user = _auth.currentUser;
    final String? userId = user?.uid;

    // Use DatabaseEvent instead of DataSnapshot here
    DatabaseEvent snapshot =
    await _database.child('users').child(userId!).child('email').once();

    // Return the email as a string
    return snapshot.snapshot.value as String?;
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: Colors.white54,
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              const ListTile(
                leading: Icon(Icons.arrow_back),
                trailing: Icon(Icons.menu),
              ),
              const SizedBox(
                height: 20,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircleAvatar(
                    maxRadius: 65,
                    backgroundImage: AssetImage("assets/6195145.jpg"),
                  ),
                ],
              ),

              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ' ${userData['firstName'] ?? ''} ${userData['lastName'] ?? ''}',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 26,
                    ),
                  )
                ],
              ),
              Container(
                child: Expanded(
                  child: ListView(
                    children: [
                      Card(
                        margin: const EdgeInsets.only(
                            left: 35, right: 35, bottom: 10),
                        color: Colors.white70,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: ListTile(
                          leading: Icon(
                            Ionicons.person_outline,
                            color: Colors.black54,
                          ),
                          title: Text(
                            ' ${userData['firstName'] ?? ''} ${userData['lastName'] ?? ''}',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      Card(
                        color: Colors.white70,
                        margin: const EdgeInsets.only(
                            left: 35, right: 35, bottom: 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: ListTile(
                          leading: Icon(
                            Ionicons.square,
                            color: Colors.black54,
                          ),
                          title: FutureBuilder<String?>(
                            future: _fetchNIC(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return Text(
                                  'NIC Loading...',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              } else if (snapshot.hasError || !snapshot.hasData) {
                                return Text(
                                  'NIC: Error',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              } else {
                                return Text(
                                  '${snapshot.data}',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ),

                      Card(
                        color: Colors.white70,
                        margin: const EdgeInsets.only(
                            left: 35, right: 35, bottom: 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: ListTile(
                          leading: Icon(
                            Icons.email_outlined,
                            color: Colors.black54,
                          ),
                          title: FutureBuilder<String?>(
                            future: _fetchEmail(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return Text(
                                  'Email address: Loading...',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              } else if (snapshot.hasError || !snapshot.hasData) {
                                return Text(
                                  'Email address: Error',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              } else {
                                return Text(
                                  '${snapshot.data}',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                      Card(
                        color: Color.fromARGB(179, 116, 159, 234),
                        margin: const EdgeInsets.only(
                            left: 35, right: 35, bottom: 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: const ListTile(
                          leading: Icon(
                            Icons.edit_outlined,
                            color: Colors.black54,
                          ),
                          title: Text(
                            'Edit Profile',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Card(
                        color: Color.fromARGB(179, 231, 95, 95),
                        margin: const EdgeInsets.only(
                            left: 35, right: 35, bottom: 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: const ListTile(
                          leading: Icon(
                            Icons.delete_outline,
                            color: Colors.black54,
                          ),
                          title: Text(
                            'Delete Profile',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Card(
                        color: const Color.fromARGB(179, 246, 189, 189),
                        margin: const EdgeInsets.only(
                            left: 35, right: 35, bottom: 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: const ListTile(
                          leading: Icon(
                            Icons.logout,
                            color: Colors.black54,
                          ),
                          title: Text(
                            'Logout',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
