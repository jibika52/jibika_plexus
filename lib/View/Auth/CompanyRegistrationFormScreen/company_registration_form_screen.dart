import 'package:flutter/material.dart';
import 'package:jibika_plexus/CustomWidget/CustomAppBar/CustomDefaultAppBar/custom_default_app_bar.dart';
import 'package:jibika_plexus/CustomWidget/CustomText/custom_text.dart';
import 'package:jibika_plexus/Utils/constants.dart';

class CompanyRegistrationScreen extends StatefulWidget {
  const CompanyRegistrationScreen({super.key});

  @override
  State<CompanyRegistrationScreen> createState() => _CompanyRegistrationScreenState();
}

class _CompanyRegistrationScreenState extends State<CompanyRegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75),
        /// Custom Default App BAr
        child: CustomDefaultAppBar(
          onTap: () {},
          text: "Company sign up",
        )
      )

    );
  }
}
