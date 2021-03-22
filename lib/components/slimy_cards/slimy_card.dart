import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slimy_card/slimy_card.dart';

class CustomSlimyCard extends StatelessWidget {
  final Color color;
  final Widget topWidget;
  final Widget bottomWidget;
  const CustomSlimyCard({Key key, this.color, this.topWidget, this.bottomWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SlimyCard(
        color: color,
        width: ScreenUtil.screenWidth,
        topCardHeight: ScreenUtil.screenHeight * 0.3,
        bottomCardHeight: ScreenUtil.screenHeight * 0.3,
        topCardWidget: topWidget,
        bottomCardWidget: bottomWidget,
      ),
    );
  }
}
