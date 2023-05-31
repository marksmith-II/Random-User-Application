import 'package:flutter/material.dart';
import '../model/user.dart';
import '../services/user_api.dart';
import '../sceen/user_detail_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];
  List<User> userForDisplay = [];

  final TextEditingController _searchController = TextEditingController();
  final List<String> filterOptions = [
    'All',
    'Male',
    'Female',
  ];
  String selectedFilter = 'All';

  @override
  void initState() {
    fetchUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final filteredUsers = userForDisplay.where((user) {
      if (selectedFilter == 'All') {
        return true;
      } else {
        return user.gender == selectedFilter.toLowerCase();
      }
    }).toList(growable: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Random People App'),
        centerTitle: mounted,
        backgroundColor: Colors.black54,
        shadowColor: Colors.blue,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (text) {
                text = text.toLowerCase();
                setState(() {
                  userForDisplay = users.where((user) {
                    var userName = user.fullName.toLowerCase();
                    return userName.contains(text);
                  }).toList();
                });
              },
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: "Search...",
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          DropdownButton(
            value: selectedFilter,
            items: filterOptions
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedFilter = value as String;
              });
            },
          ),
          Expanded(
            child: ListView.builder(
              addRepaintBoundaries: true,
              padding: const EdgeInsets.all(10.0),
              // itemCount: userForDisplay.length,
              itemBuilder: (context, index) {
                final user = filteredUsers[index];
                final imageUrl = user.picture.thumbnail;
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserDetailPage(user: user),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(180),
                        child: Image.network(imageUrl),
                      ),
                      title: Text(user.fullName),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(user.location.country),
                        ],
                      ),
                    ),
                  ),
                );
              },

              itemCount: users.isNotEmpty ? filteredUsers.length : 0,
              // physics: const ClampingScrollPhysics(),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> fetchUsers() async {
    final response = await UserApi.fetchUsers();
    setState(() {
      users = response;
      userForDisplay = users;
    });
  }
}
