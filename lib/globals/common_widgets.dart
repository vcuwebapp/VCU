// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'common_variables.dart';

showProgressIndicator(BuildContext context, String action) {
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircularProgressIndicator(
          backgroundColor: kPrimaryColor,
          valueColor: AlwaysStoppedAnimation<Color>(kWhiteColor),
        ),
        Text(
          action,
          softWrap: true,
        ),
      ],
    ),
  );
}

showFlutterToastMsg(String msg, Color toastColor) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: toastColor,
    textColor: Colors.white,
    fontSize: 15.0,
  );
}
