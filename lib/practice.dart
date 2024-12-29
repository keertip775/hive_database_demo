void main() {
  List studentlist = [];
  // Student s = Student();

  // s.name = "Keerti";
  // s.age = 22;
  // s.address = "guggari peth";
  // studentlist.add(s);
  // for (var item in studentlist) {
  //   print(item.name);
  //   greet("Keerti", "Policepatil");
  //   greet("Police", "keerti");
  //   greet2(firstName: "spoo", age: 23);
  //   greet2(age: 23, firstName: "spoo");
  studentlist.add(Student(name: "keerti", age: 22, address: "Apmc"));
  studentlist.add(Student(name: "keerti", age: 22, address: "Apmc"));

  studentlist.add(Student(name: "keerti", age: 22, address: "Apmc"));

  studentlist.add(Student(name: "keerti", age: 22, address: "Apmc"));
  studentlist.add(Student(name: "keeru"));
  studentlist.add(
    Student(name: "apoo"),
  );
  for (var items in studentlist) {
    print(items.age ?? "N/a");
    print(items.name);
    print(items.address ?? "n/a");
  }
}

void greet(String firstName, String Lastname) {
  print("My name is $firstName $Lastname");
}

void greet2({required String firstName, required int age}) {
  print("My name is $firstName $age");
}

class Student {
  String? name;
  int? age;
  String? address;
  Student({this.name, this.age, this.address});
}
