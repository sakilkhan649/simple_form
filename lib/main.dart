import 'package:data/page1.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage(), debugShowCheckedModeBanner: false);
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //Global Variable..............
  final _formkey = GlobalKey<FormState>();

  //Controller er jonno Variable...............
  TextEditingController _nameController = TextEditingController();
  TextEditingController _instituteController = TextEditingController();
  TextEditingController _rollController = TextEditingController();
  TextEditingController _districtController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("HomePage"),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),

        //Form Widget...................
        body: Form(
          key: _formkey, //Form keyte Globar variable bosano holo
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                    labelText: "Name",
                    hintText: "Enter Your Name",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter Your Name";
                    }
                    if (!RegExp(r"^[A-Za-z :]+$").hasMatch(value)) {
                      return "Enter Your Name";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  controller: _instituteController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                    labelText: "Institute",
                    hintText: "Enter Your Institute Name",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter Your Institute Name";
                    }
                    if (!RegExp(r"^[A-Za-z ]+$").hasMatch(value)) {
                      return "Enter your Institute Name";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  controller: _rollController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                    labelText: "Roll",
                    hintText: "Enter Your Roll",
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter Your Roll";
                    }
                    if (!RegExp(r"^[0-9]+$").hasMatch(value)) {
                      return "Roll must contain only digit";
                    }
                    int roll = int.parse(value);
                    if (roll < 0) {
                      return "Enter a valid Roll";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  controller: _districtController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                    labelText: "District",
                    hintText: "Enter your home district",
                    hintStyle: TextStyle(color: Colors.black),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter Your District";
                    }
                    if (!RegExp(r"^[A-Za-z ]+$").hasMatch(value)) {
                      return "Enter your Institute Name";
                    }
                    return null;
                  },
                ),
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    String name = _nameController.text;
                    String institute = _instituteController.text;
                    String roll = _rollController.text;
                    String district = _districtController.text;

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Page1(
                          name: name,
                          institute: institute,
                          roll: roll,
                          destrict: district,
                        ),
                      ),
                    );
                  }
                },
                child: Text("Submit", style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
