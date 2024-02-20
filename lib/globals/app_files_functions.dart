import 'dart:io';

import 'package:flutter_archive/flutter_archive.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vcu_2023/globals/permissions_and_settings_functions.dart';

import 'common_functions.dart';
import 'common_variables.dart';
import 'common_widgets.dart';

createFolder() async {
  PermissionStatus status = PermissionStatus.granted;
  try {
    if (Platform.isAndroid) {
      status = await isAndroidVersionLessThan13()
          ? await Permission.storage.status
          : PermissionStatus.granted;
    }
  } catch (e) {
    //debugPrint('Permission status error: $e');
  }
  bool createFolders = true;
  String appFolderPath = 'NONE';
  if (status.isDenied || status.isPermanentlyDenied || (!status.isGranted)) {
    await Permission.storage.request().then((value) {
      if (!value.isGranted) {
        createFolders = false;
      }
    });
  }
  if (createFolders) {
    const folderName = "vcu";
    final dir = Directory(
      '${(Platform.isAndroid ? await getExternalStorageDirectory() : await getApplicationSupportDirectory())!.path}/$folderName',
    );
    if (dir.existsSync()) {
      appFolderPath = dir.path;
    } else {
      dir.create().then((value) async {
        appFolderPath = dir.path;
      });
    }
  }
  return appFolderPath;
}

createAttachmentFolder() async {
  String appFolderPath = await createFolder();
  String attachmentDirPath = '$appFolderPath/attachments/';
  Directory f = Directory(attachmentDirPath);
  if (!f.existsSync()) {
    await f.create();
  }
  return attachmentDirPath;
}

createLogFiles() async {
  String appFolderPath = await createFolder();
  String logsDirPath = '$appFolderPath/logs/';
  Directory directory = Directory(logsDirPath);
  if (!directory.existsSync()) {
    await directory.create();
  }
  return logsDirPath;
}

eventLog(String msg) async {
  String logsDirPath = await createLogFiles();
  String eventLogPath = join(logsDirPath, 'EventLog.txt');
  if ((File(eventLogPath).existsSync())) {
    try {
      await File(eventLogPath)
          .writeAsString("\n[${DateTime.now()}] $msg", mode: FileMode.append);
    } catch (e) {
      errorLog('File operation failed (eventLog): $e');
    }
  } else {
    try {
      await File(eventLogPath).create();
      await File(eventLogPath).writeAsString('[${DateTime.now()}] $msg');
    } catch (e) {
      errorLog('File operation failed (eventLog): $e');
    }
  }
}

downloadedDataLog(String msg) async {
  String logsDirPath = await createLogFiles();
  String downloadedDataLogPath = join(logsDirPath, 'DownloadedDataLog.txt');
  if ((File(downloadedDataLogPath).existsSync())) {
    try {
      await File(downloadedDataLogPath)
          .writeAsString("\n[${DateTime.now()}] $msg", mode: FileMode.append);
    } catch (e) {
      errorLog('File operation failed (downloadedDataLog): $e');
    }
  } else {
    try {
      await File(downloadedDataLogPath).create();
      await File(downloadedDataLogPath)
          .writeAsString('[${DateTime.now()}] $msg');
    } catch (e) {
      errorLog('File operation failed (downloadedDataLog): $e');
    }
  }
}

uploadedDataLog(String msg) async {
  String logsDirPath = await createLogFiles();
  String uploadedDataLogPath = join(logsDirPath, 'UploadedDataLog.txt');
  if ((File(uploadedDataLogPath).existsSync())) {
    try {
      await File(uploadedDataLogPath)
          .writeAsString("\n[${DateTime.now()}] $msg", mode: FileMode.append);
    } catch (e) {
      errorLog('File operation failed (uploadedDataLog): $e');
    }
  } else {
    try {
      await File(uploadedDataLogPath).create();
      await File(uploadedDataLogPath).writeAsString('[${DateTime.now()}] $msg');
    } catch (e) {
      errorLog('File operation failed (uploadedDataLog): $e');
    }
  }
}

serverResponseLog(String msg) async {
  String logsDirPath = await createLogFiles();
  String serverResponseLogPath = join(logsDirPath, 'ServerResponseLog.txt');
  if ((File(serverResponseLogPath).existsSync())) {
    try {
      await File(serverResponseLogPath)
          .writeAsString("\n[${DateTime.now()}] $msg", mode: FileMode.append);
    } catch (e) {
      errorLog('File operation failed (serverResponseLog): $e');
    }
  } else {
    try {
      await File(serverResponseLogPath).create();
      await File(serverResponseLogPath)
          .writeAsString('[${DateTime.now()}] $msg');
    } catch (e) {
      errorLog('File operation failed (serverResponseLog): $e');
    }
  }
}

///Used to send the log file to email address.
uploadLogFiles(String usermsg) async {
  List<File> files = [];
  final dir = Directory(await createLogFiles());
  final List<FileSystemEntity> entities = await dir.list().toList();
  for (int i = 0; i < entities.length; i++) {
    files.add(File(entities.elementAt(i).path));
  }
  String logsFilePath = join(await createFolder(), 'logfiles.zip');
  await ZipFile.createFromFiles(
    sourceDir: dir,
    files: files,
    zipFile: File(logsFilePath),
    includeBaseDirectory: false,
  );
  if (await File(logsFilePath).length() <= 25000000) {
    sendEmail(
      logsFilePath,
      ["vaishvika.pawar@gmail.com", "vcuwebapp@gmail.com"],
      "Log files from ${prefs.getString('username')}",
      "User Message:\n$usermsg",
      "Log files sent!",
      "Failed to send log files!",
    );
  } else {
    showFlutterToastMsg("Failed to send log files!", kRedColor);
  }
}

errorLog(String msg) async {
  String logsDirPath = await createLogFiles();
  String errorLogPath = join(logsDirPath, 'ErrorLog.txt');
  if ((File(errorLogPath).existsSync())) {
    try {
      await File(errorLogPath)
          .writeAsString("\n[${DateTime.now()}] $msg", mode: FileMode.append);
    } catch (e) {
      errorLog('File operation failed (errorLog): $e');
    }
  } else {
    try {
      await File(errorLogPath).create();
      await File(errorLogPath).writeAsString('[${DateTime.now()}] $msg');
    } catch (e) {
      errorLog('File operation failed (errorLog): $e');
    }
  }
}

///Deletes the cache of the app.
Future<void> deleteCacheDir() async {
  final cacheDir = await getTemporaryDirectory();

  if (cacheDir.existsSync()) {
    cacheDir.deleteSync(recursive: true);
  }
}

///Deletes the app's storage.
Future<void> deleteAppDir() async {
  final appDir = await getApplicationSupportDirectory();
  if (appDir.existsSync()) {
    appDir.deleteSync(recursive: true);
  }
}

///Deleted the file.
Future<void> deleteFile(File file) async {
  try {
    if (file.existsSync()) {
      await file.delete();
    }
  } catch (e) {
    errorLog(
      "Unable to delete ${file.path.split('/').last}!",
    );
  }
}
