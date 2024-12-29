import 'package:dio/dio.dart';
import 'package:hive_database_demo/models/user.dart';

void main() async {
  User? singleuser;

  var res = await Dio().get("https://dummyjson.com/users/3");
  if (res.statusCode != 200) {
    print("api failed");
    return;
  }
  singleuser = User.fromMap(res.data);
  print("firstname ${singleuser.firstName} age ${singleuser.age}");
}

class Student {
  String? name;
  int? age;
  String? city;

  Student({this.name, this.age, this.city});
}
