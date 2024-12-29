void main() {
  List<Student> studentsList = [];

  Student s = Student();
  s.name = "keerti";
  s.age = 22;
  s.city = "ilkal";
  Student s2 = Student();
  s2.name = "spoorti";
  s2.age = 22;
  s2.city = "ilkal";

  studentsList.add(s);
  studentsList.add(s2);

  for (var item in studentsList) {
    print(item.name);
  }
  // greet(fistName: "keeri", lastName: "p");
  // greet(lastName: "p", fistName: "keerti");

  // greet2("keeri", "p");
  // greet2("p", "keerti");
}

// void greet({required String fistName, required String lastName}) {
//   print("Hello, $fistName $lastName");
// }

// void greet2(String fistName, String lastName) {
//   print("Hello, $fistName $lastName");
// }

class Student {
  String? name;
  int? age;
  String? city;
}
