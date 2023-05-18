import 'package:flutter/material.dart';
import '../model/user.dart';

class UserDetailPage extends StatelessWidget {
  final User user;

  const UserDetailPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.fullName),
        backgroundColor: Colors.black54,
        shadowColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100),
            Image.network(user.picture.large),
            SizedBox(height: 10),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text(
                      textAlign: TextAlign.left,
                      user.fullName,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    Text(
                      textAlign: TextAlign.left,
                      user.email,
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      textAlign: TextAlign.left,
                      user.location.country,
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
