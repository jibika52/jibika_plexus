import 'package:flutter/material.dart';
import 'package:jibika_plexus/CustomWidget/CustomText/custom_text.dart';

class SelfPaySlepScreen extends StatefulWidget {
  const SelfPaySlepScreen({super.key});

  @override
  State<SelfPaySlepScreen> createState() => _SelfPaySlepScreenState();
}

class _SelfPaySlepScreenState extends State<SelfPaySlepScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
           CustomText(fontSize: 13, fontWeight: FontWeight.w700, text: "Geebee Garments Industries Ltd.", letterSpacing: 0.3)
          ],
        ),
      ),
    );
  }
}
