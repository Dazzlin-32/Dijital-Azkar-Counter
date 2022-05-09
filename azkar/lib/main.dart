import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  List azkar_names = ['AlhamduLillah','Allahu Akbar','Subhanallah','Subhan Allah Wa Bihamdih','Subhan Allah Wa Bihamdih Subahan Allah Al Azim ','La Ilaha Ilallah'];
  int azkar_picNo = 1;
  int pressed = 0;
  void pressed_times() {
    pressed = pressed + 1;
  }

  void random_number() {
    pressed = 0;
    Random random = new Random();
    azkar_picNo = random.nextInt(6) + 1;
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[800],
          title: Center(
            child: Text(
              'Azkar',
              style: TextStyle(fontSize: 28),
            ),
          ),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  setState(() {
                    random_number();
                  });
                },
                child: Text(
                  'Change Azkar',
                  style: TextStyle(fontSize: 20),
                )),
            Expanded(
              child: TextButton(
                  onPressed: () {
                    setState(() {
                      pressed_times();
                    });
                  },
                  child: Image.asset('assets/azkar$azkar_picNo.jpg')),
            ),
            Text(azkar_names[azkar_picNo-1],
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),),
            Row(
              children: [
                Text('Number of azkars done: $pressed',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),),
                TextButton(onPressed: (){}, 
                child: Text('Sound')
                )
              ],
            )
          ],
        )),
      ),
    );
  }
}
