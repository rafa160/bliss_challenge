
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton(
      {Key key,
        this.text,
        this.onPressed,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Container(
      width: ScreenUtil.screenWidth * 0.4,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.blueAccent,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
          ),
          onPressed: onPressed,
          child: Text(text)),
    );
  }
}
