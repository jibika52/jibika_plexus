
import 'dart:async';

import 'package:flutter/material.dart';

class TestLongPress extends StatefulWidget {
  const TestLongPress({super.key});

  @override
  State<TestLongPress> createState() => _TestLongPressState();
}

class _TestLongPressState extends State<TestLongPress> {

  String action = "START";
  Timer? timer;
  int number = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(action),
              SizedBox(height: 50),
              Material(
                borderRadius: BorderRadius.circular(20),
                elevation: 20,
                child: GestureDetector(

                  onLongPress: () => setState(() {
                    timer = Timer.periodic(Duration(milliseconds: 50), (timer) {
                      setState(() {
                        action = "Longpress started";
                        number++;
                      });
                    });
                  }),

                  onLongPressEnd: (_) => setState(() {
                    action = "Longpress stopped";
                    timer?.cancel();
                  }),

                  child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.red[50],
                          borderRadius: BorderRadius.circular(20)
                      ),
                      width: 100,
                      height: 100,
                      child: Text('Tap')
                  ),
                ),
              ),
              SizedBox(height: 50,),
              Text(number.toString(),style: TextStyle(
                fontSize: 25,
              ),)
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }



}