import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
      body: Container(
        child: Center(
          child: Text("JIBIKA",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,letterSpacing: 0.2),),
        ),
      ),
    );
  }
}
