import 'package:dio/dio.dart';
import 'package:hive_database_demo/models/user.dart';

void main() async {
  List<User> studentsList = [];

  var res = await Dio().get("https://dummyjson.com/users?limit=10");
  if (res.statusCode != 200) {
    print("api failed");
    return;
  }
  var users = res.data["users"];

  for (var user in users) {
    studentsList.add(User.fromMap(user));
  }

  for (var item in studentsList) {
    print(item.firstName);
    print(item.age);

    //   print(item.age);
    //   print(item.city ?? "N/A");
  }
}

class Student {
  String? name;
  int? age;
  String? city;

  Student({this.name, this.age, this.city});
}
