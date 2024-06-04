import 'package:flutter/material.dart';

import '../../CustomWidget/CustomText/custom_text.dart';

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
          child: CustomText(fontSize: 25, fontWeight: FontWeight.w900, text: "JIBIKA", letterSpacing: 0.1),
        ),
      ),
    );
  }
}

