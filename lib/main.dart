import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
// import 'package:hive_database_demo/users_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
// import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final dir = await getApplicationDocumentsDirectory();
  // Hive.init(dir.path);
  // await Hive.openBox("students");
  runApp(
    DevicePreview(
      enabled: false,

      builder: (context) => MaterialApp(
        home: MyApp(),
        useInheritedMediaQuery: true,
      ), // Wrap your app
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController rollNoController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  Box? studentbox;

  @override
  void initState() {
    // TODO: implement initState
    studentbox = Hive.box("students");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hive database"),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.yellow,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (_) {
                              return Dialog(
                                child: Column(
                                  children: [
                                    TextField(
                                      controller: rollNoController,
                                    ),
                                    TextField(
                                      controller: nameController,
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        studentbox?.put(rollNoController.text,
                                            nameController.text);
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "submit",
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                      },
                      child: Text(
                        "Add Student",
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (_) {
                              return Dialog(
                                child: Column(
                                  children: [
                                    TextField(
                                      controller: rollNoController,
                                    ),
                                    TextField(
                                      controller: nameController,
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        studentbox?.put(rollNoController.text,
                                            nameController.text);
                                        rollNoController.clear();
                                        nameController.clear();
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "submit",
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                      },
                      child: Text(
                        "Update Student",
                      ),
                    ),
                  ],
                ),
                Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        studentbox?.delete(rollNoController.text);
                        Navigator.pop(context);
                        showDialog(
                            context: context,
                            builder: (_) {
                              return Dialog(
                                child: Column(
                                  children: [
                                    TextField(
                                      controller: rollNoController,
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "submit",
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                      },
                      child: Text(
                        "Delete Student",
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (_) {
                              return Dialog(
                                child: Column(
                                  children: [
                                    TextField(
                                      controller: rollNoController,
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        print("student");
                                        print(studentbox
                                            ?.get(rollNoController.text));
                                      },
                                      child: Text(
                                        "submit a",
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                      },
                      child: Text(
                        "Show Student",
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: studentbox?.length ?? 0,
                itemBuilder: (context, index) {
                  var values = studentbox!.values.toList();
                  var keys = studentbox!.keys.toList();
                  // var name;

                  //name: spoorti
                  //roll no: 22
                  //ok  i will call yo after 20 min, i
                  // OK

                  return ListTile(
                    title: Text("name: ${values[index]}"),
                    subtitle: Text("rollno:${keys[index]}"),
                  );
                }),
          )
        ],
      ),
    );
  }
}
