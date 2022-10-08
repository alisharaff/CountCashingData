import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:shared_preferences/shared_preferences.dart';

int count = 0;
  int? counter=0;
cachData() async {
  // Obtain shared preferences.
  final prefs = await SharedPreferences.getInstance();
  // Save an integer value to 'counter' key.
    await prefs.setInt('count', count);
  // Try reading data from the 'counter' key. If it doesn't exist, returns null.
        counter = prefs.getInt('count');
        print(counter);
}
 
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(children: [
          const SizedBox(
            height: 200.0,
          ),
          ElevatedButton(
              onPressed: ((){
               
                setState(() {
                  count++;
                  cachData();
                });
              }), child: const Icon(Icons.add)),
          Text(
            "${counter}",
            style: const TextStyle(fontSize: 30.0),
          ),
          ElevatedButton(
              onPressed: (() {
               
                setState(() {
                  count--;
                  cachData();
                });
              }),
              child: const Icon(Icons.remove))
        ]),
      ),
    );
  }
}
