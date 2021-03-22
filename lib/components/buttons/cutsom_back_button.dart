import 'package:bliss_challenge/components/buttons/custom_buttom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../helpers/strings.dart';


class CustomBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: CustomButton(
          text: Strings.BTN_BACK,
          onPressed: () async {
            Get.back();
          },
        ),
      ),
    );
  }
}
