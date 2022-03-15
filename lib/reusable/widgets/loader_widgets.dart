import 'package:flutter/material.dart';
import 'package:ud_design/ud_design.dart';

import '../constants/colors.dart';

class CircleLoader extends StatelessWidget {
  final double size;
  final Color color;

  CircleLoader({this.size = 24.0, this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: UdDesign.pt(size),
      width: UdDesign.pt(size),
      child: CircularProgressIndicator(
        backgroundColor: ProjectColors.themeBlue,
        valueColor: AlwaysStoppedAnimation<Color>(color),
        value: null,
        strokeWidth: 3.0,
      ),
    );
  }
}
