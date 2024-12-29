void main() {
  List<Student> studentsList = [];

  // Student s = Student();
  // s.name = "keerti";
  // s.age = 22;
  // s.city = "ilkal";
  // Student s2 = Student();
  // s2.name = "spoorti";
  // s2.age = 22;
  // s2.city = "ilkal";

  studentsList.add(Student(name: "keerti", age: 22));
  studentsList.add(Student(name: "spoorti", age: 23, city: "banglore"));
  studentsList.add(Student(name: "spoorti", age: 23, city: "banglore"));
  studentsList.add(Student(name: "spoorti", age: 23, city: "banglore"));
  studentsList.add(Student(name: "spoorti", age: 23, city: "banglore"));
  studentsList.add(Student(name: "spoorti", age: 23, city: "banglore"));
  studentsList.add(Student(name: "spoorti", age: 23, city: "banglore"));
  studentsList.add(Student(name: "spoorti", age: 23, city: "banglore"));
  studentsList.add(Student(name: "spoorti", age: 23, city: "banglore"));

  for (var item in studentsList) {
    print(item.name);

    print(item.age);
    print(item.city ?? "N/A");
  }
}

class Student {
  String? name;
  int? age;
  String? city;

  Student({this.name, this.age, this.city});
}
