import 'package:flutter/material.dart';

class SelfBootomBarJobCardScreen extends StatefulWidget {
  const SelfBootomBarJobCardScreen({super.key});

  @override
  State<SelfBootomBarJobCardScreen> createState() => _SelfBootomBarJobCardScreenState();
}

class _SelfBootomBarJobCardScreenState extends State<SelfBootomBarJobCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.red,
        padding: EdgeInsets.all(10),
        child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
        ), itemBuilder: (context, index) {
          return Card(child: Container(
            height: 100,
            width: 100, 
          ),);
        },),
      ),
    );
  }
}
