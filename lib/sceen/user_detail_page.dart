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
          color: Colors.blueGrey,
          shadowColor: Colors.blueAccent,
          child: Column(
            children: [
              const SizedBox(height: 80),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(user.picture.large),
              ),
              // const SizedBox(height: 20),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                height: 20,
                width: 350,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Contact Information:",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "Phone: ${user.phone}",
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "Cell: ${user.cell}",
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "Email: ${user.email}",
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
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Address:",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        user.location.fullStreetName,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "${user.location.city}, ${user.location.state}, ${user.location.postcode}",
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        user.location.country,
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
              // const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
