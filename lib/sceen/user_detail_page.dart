import 'package:flutter/material.dart';
import '../model/user.dart';

class UserDetailPage extends StatelessWidget {
  final User user;

  const UserDetailPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile Information'),
          backgroundColor: Colors.black54,
          shadowColor: Colors.blue,
        ),
        body: Center(
            child: Card(
                color: const Color.fromARGB(255, 53, 74, 85),
                shadowColor: Colors.blueAccent,
                child: Column(children: [
                  const SizedBox(height: 80),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(70.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(user.picture.large),
                          ),
                          Text(
                            user.fullName,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.lightGreen,
                            ),
                          ),
                          Text(
                            "Gender: ${user.gender}",
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            "Age: ${user.dob.age}",
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            "Location: ${user.location.city}",
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                    width: 350,
                  ),
                  FloatingActionButton(
                      backgroundColor: Colors.lightGreen,
                      heroTag: 'Address',
                      elevation: 10.0,
                      child: const Icon(Icons.location_on),
                      onPressed: () {
                        // Show the address popup.
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("Address"),
                              content: Text.rich(
                                TextSpan(children: [
                                  TextSpan(
                                      text: user.location.fullStreetName,
                                      style: const TextStyle(
                                          fontSize: 16.0, color: Colors.black)),
                                  const TextSpan(
                                      text: '\n',
                                      style: TextStyle(
                                          fontSize: 16.0, color: Colors.black)),
                                  TextSpan(
                                      text: user.location.city,
                                      style: const TextStyle(
                                          fontSize: 16.0, color: Colors.black)),
                                  const TextSpan(
                                      text: ' ',
                                      style: TextStyle(
                                          fontSize: 16.0, color: Colors.black)),
                                  TextSpan(
                                      text: user.location.state,
                                      style: const TextStyle(
                                          fontSize: 16.0, color: Colors.black)),
                                  const TextSpan(
                                      text: ', ',
                                      style: TextStyle(
                                          fontSize: 16.0, color: Colors.black)),
                                  TextSpan(
                                      text: user.location.postcode,
                                      style: const TextStyle(
                                          fontSize: 16.0, color: Colors.black)),
                                  const TextSpan(
                                      text: '\n',
                                      style: TextStyle(
                                          fontSize: 16.0, color: Colors.black)),
                                  TextSpan(
                                      text: user.location.country,
                                      style: const TextStyle(
                                          fontSize: 16.0, color: Colors.black))
                                ]),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("Close"),
                                ),
                              ],
                            );
                          },
                        );
                      }),
                  FloatingActionButton(
                      backgroundColor: Colors.lightGreen,
                      heroTag: 'Contact',
                      elevation: 5.0,
                      child: const Icon(Icons.contact_phone),
                      onPressed: () {
                        // Show the contact information popup.
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("Contact Information"),
                              content: Text.rich(
                                TextSpan(
                                    // text: '',
                                    // style: const TextStyle(
                                    //     fontSize: 16.0, color: Colors.black),
                                    children: [
                                      TextSpan(
                                          text: "Phone: ${user.phone}",
                                          style: const TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.black)),
                                      const TextSpan(
                                          text: '\n',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.black)),
                                      TextSpan(
                                          text: "Cell:  ${user.cell}",
                                          style: const TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.black)),
                                      const TextSpan(
                                          text: '\n',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.black)),
                                      TextSpan(
                                          text: "Email: ${user.email}",
                                          style: const TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.black)),
                                    ]),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("Close"),
                                ),
                                // const SizedBox(height: 25),
                              ],
                            );
                          },
                        );
                      })
                ]))));
  }
}
