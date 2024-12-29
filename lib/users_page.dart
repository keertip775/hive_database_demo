import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive_database_demo/models/user.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  List<User> usersList = [];

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  Future<void> getUsers() async {
    var res = await Dio().get("https://dummyjson.com/users?limit=100");
    if (res.statusCode != 200) {
      print("api failed");
      return;
    }
    var users = res.data["users"];

    for (var user in users) {
      usersList.add(User.fromMap(user));
    }

    setState(() {});

    print(usersList.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: usersList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(usersList[index].firstName ?? ""),
            );
          }),
    );
  }
}
