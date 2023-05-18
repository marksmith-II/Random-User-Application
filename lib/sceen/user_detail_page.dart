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
      ),
      body: Center(
        child: Column(
          children: [
            Image.network(user.picture.thumbnail),
            Text(user.fullName),
            Text(user.email),
            Text(user.location.country),
          ],
        ),
      ),
    );
  }
}
