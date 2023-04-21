import 'package:flutter/material.dart';

class MyCardWidget extends StatelessWidget {
  const MyCardWidget({
    super.key,
    required this.myText,
    required TextEditingController nameController,
  }) : _nameController = nameController;

  final String myText;
  final TextEditingController _nameController;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset("assets/nissan-drift.jpg"),
          SizedBox(
            height: 20,
          ),
          Text(
            "Time for a quarter mile is " + myText,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: _nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Dans les 10, tkt",
                labelText: "Time",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
