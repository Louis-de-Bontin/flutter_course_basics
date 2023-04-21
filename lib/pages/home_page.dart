import "package:flutter/material.dart";
import 'package:flutter_application_1/drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../utils/constants.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "/home";
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // var myText = "how fast ?";
  // TextEditingController _nameController = TextEditingController();
  // var url = "https://query1.finance.yahoo.com/v8/finance/chart/GME";
  var url = Uri.https(
    'query1.finance.yahoo.com',
    '/v8/finance/chart/TSLA',
    {'interval': '1d', 'range': '1y'},
  );
  var data;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    var res = await http.get(url);
    data = jsonDecode(res.body);
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[700],
      appBar: AppBar(
        title: const Text("LABABZ"),
        actions: [
          IconButton(
            onPressed: () {
              Constants.prefs.setBool("loggedIn", false);
              Navigator.pushReplacementNamed(context, LoginPage.routeName);
            },
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: data != null
          ? GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                final reverseIndex =
                    data["chart"]["result"][0]["timestamp"].length - index - 1;
                return ListTile(
                  title: Text(
                    DateTime.fromMicrosecondsSinceEpoch(data["chart"]["result"]
                            [0]["timestamp"][reverseIndex])
                        .toString(),
                    style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  subtitle: Text(
                    data["chart"]["result"][0]["indicators"]["quote"][0]["open"]
                            [reverseIndex]
                        .toString(),
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  leading: Image.asset("assets/nissan-drift.jpg"),
                );
              },
              itemCount: data["chart"]["result"][0]["timestamp"].length)
          : const Center(child: CircularProgressIndicator()),
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fetchData();
          // myText = _nameController.text;
          // setState(() {});
        },
        child: const Icon(Icons.psychology),
      ),
    );
  }
}
