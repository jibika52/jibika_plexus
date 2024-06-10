import 'package:flutter/material.dart';

import '../../../Utils/constants.dart';

class ThirdPartProgressBar extends StatefulWidget {
   ThirdPartProgressBar({super.key,
   required this.presentheight,
   required this.absenttheight,
   });
   double presentheight;
   double absenttheight;
  @override
  State<ThirdPartProgressBar> createState() => _ThirdPartProgressBarState();
}

class _ThirdPartProgressBarState extends State<ThirdPartProgressBar>   with TickerProviderStateMixin {
  late AnimationController controller;


  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
      setState(() {});
    });
    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 21,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            height: widget.presentheight,
            width: 10,
            child: RotatedBox(
              quarterTurns: -1,
              child: LinearProgressIndicator(
                color: presentsent_color,
                value: controller.value,
                semanticsLabel: 'Linear progress indicator',
              ),
            ),
          ),
          Spacer(),
          Container(
            height: widget.absenttheight,
            width: 10,
            child: RotatedBox(
              quarterTurns: -1,
              child: LinearProgressIndicator(
                color: absent_color,
                value: controller.value,
                semanticsLabel: 'Linear progress indicator',

              ),
            ),
          ),
        ],
      ),
    );
  }
}
