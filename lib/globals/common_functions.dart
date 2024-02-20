import 'dart:io';

import 'package:datetime_setting/datetime_setting.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

import 'app_files_functions.dart';
import 'common_variables.dart';
import 'common_widgets.dart';

checkAutoDateTime() async {
  bool autoDateTimeEnabled = true;
  try {
    bool timeAuto = await DatetimeSetting.timeIsAuto();
    bool timezoneAuto = await DatetimeSetting.timeZoneIsAuto();
    if (!timezoneAuto || !timeAuto) {
      autoDateTimeEnabled = false;
      await DatetimeSetting.openSetting();
    }
  } catch (e) {
    debugPrint('checkAutoDateTime error: $e');
  }
  return autoDateTimeEnabled;
}

AssetImage getSubjectImage(String subjectName) {
  switch (subjectName) {
    case 'physics':
      return const AssetImage('assets/images/phyico.png');
    case 'mathematics':
      return const AssetImage('assets/images/matico.png');
    case 'chemistry':
      return const AssetImage('assets/images/chemico.png');
    case 'biology':
      return const AssetImage('assets/images/bioico.png');
    default:
      return const AssetImage('assets/images/tslogo.png');
  }
}

///Smtp configurationa and sending email to configured email address.
sendEmail(
  String filePath,
  List<String> recipientlist,
  String subject,
  String bodyText,
  String successMsg,
  String errorMsg,
) async {
  String username = '';
  String password = '';

  final smtpServer = SmtpServer(
    "<host>",
    password: password,
    name: "<hostname>",
    port: 587,
    username: username,
    allowInsecure: true,
    ignoreBadCertificate: true,
  );
  final message = Message()
    ..from = const Address("support@youtility.in")
    ..subject = subject
    ..text = bodyText;
  for (int i = 0; i < recipientlist.length; i++) {
    message.recipients.add(Address(recipientlist[i]));
  }
  if (filePath != 'NONE') {
    message.attachments.add(FileAttachment(File(filePath)));
  }
  try {
    final sendReport = await send(message, smtpServer);
    eventLog("Email sent: Subject: $subject: [$sendReport]");
    if (successMsg != 'NONE') {
      showFlutterToastMsg(successMsg, kGreenColor);
    }
  } on MailerException catch (e) {
    errorLog("Email error: $e");
    if (errorMsg != 'NONE') {
      showFlutterToastMsg(errorMsg, kRedColor);
    }
  }
}
