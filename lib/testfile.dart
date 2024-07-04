import 'package:flutter/material.dart';

class testFile extends StatefulWidget {
  const testFile({super.key});

  @override
  State<testFile> createState() => _testFileState();
}

class _testFileState extends State<testFile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.red,
        child: Column(
          children: [
            Container(
              height: 100,
              width: double.infinity,
              child: TextFormField(
                decoration: InputDecoration(hintText: "Search here now"),
              ),
            )
          ],
        ),
    ),
    );
  }
}
