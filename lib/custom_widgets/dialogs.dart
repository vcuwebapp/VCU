// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../globals/app_files_functions.dart';
import '../globals/common_variables.dart';
import '../globals/common_widgets.dart';

///Shows alert dialog of confirmation to send og files with a description of the problem message.
logFileSendingConfirmationWithRequiredMsg(
    BuildContext context, String usermsg) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        scrollable: true,
        actionsAlignment: MainAxisAlignment.spaceBetween,
        title: const Text('Do you want to send log files?'),
        content: SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Form(
            child: TextFormField(
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                label: const Text(
                  'Please describe the problem.',
                  textAlign: TextAlign.start,
                ),
              ),
              enableSuggestions: true,
              autocorrect: true,
              maxLines: null,
              minLines: null,
              expands: true,
              maxLength: 200,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              onChanged: (value) {
                usermsg = value;
              },
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Cancel',
              style: TextStyle(color: kRedColor),
            ),
          ),
          TextButton(
            onPressed: () {
              if (usermsg != 'Not added!' && usermsg.isNotEmpty) {
                Navigator.pop(context);
                uploadLogFiles(usermsg);
              } else {
                showFlutterToastMsg(
                    'Please describe the problem before sending log files!',
                    kRedColor);
              }
            },
            child: const Text(
              'Send',
              style: TextStyle(color: kGreenColor),
            ),
          ),
        ],
      );
    },
  );
}

showExitPopup(context, String title, String identifier) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          title,
          softWrap: true,
        ),
        actionsAlignment: MainAxisAlignment.spaceBetween,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text("No", style: TextStyle(color: kRedColor)),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: const Text("Yes", style: TextStyle(color: kGreenColor)),
          ),
        ],
      );
    },
  );
}
