// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../custom_widgets/dialogs.dart';
import 'app_files_functions.dart';
import 'common_variables.dart';
import 'common_widgets.dart';

class Camera extends StatefulWidget {
  final int selectedCameraIndex;
  final String? serverPath;
  final bool disableCameraSwitch;
  final String studentId;

  const Camera({
    super.key,
    required this.selectedCameraIndex,
    required this.serverPath,
    required this.disableCameraSwitch,
    required this.studentId,
  });

  @override
  CameraScreen createState() => CameraScreen();
}

class CameraScreen extends State<Camera> {
  List<CameraDescription> cameras = [];
  int selectedCameraIndex = 0;
  String? imgPath;
  late String appAttachmentsDir;
  CameraController cameraController = CameraController(
    const CameraDescription(
      lensDirection: CameraLensDirection.back,
      name: '',
      sensorOrientation: 0,
    ),
    ResolutionPreset.medium,
  );
  String serverPath = 'NONE';
  String fileName = 'NONE';
  String filePath = 'NONE';
  bool flashOn = false;
  bool cameraButtonPressed = false;

  @override
  void initState() {
    super.initState();
    serverPath = widget.serverPath ?? 'NONE';
    availableCameras().then((availableCameras) {
      cameras = availableCameras;
      if (cameras.isNotEmpty) {
        setState(() {
          selectedCameraIndex = widget.selectedCameraIndex;
        });
        _initCameraController(
          cameras[selectedCameraIndex],
        );
      }
    }).catchError((err) {
      debugPrint('Error on availableCameras method: $err');
    });
  }

  Future _initCameraController(CameraDescription cameraDescription) async {
    prefs = await SharedPreferences.getInstance();
    appAttachmentsDir = await createAttachmentFolder();
    cameraController = CameraController(
      cameraDescription,
      ResolutionPreset.medium,
    );
    cameraController.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    try {
      await cameraController.initialize();
    } on CameraException catch (e) {
      _showCameraException(e);
    }
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future(() async =>
            await showExitPopup(context, "Do you want to exit?", 'NONE')
                ? true
                : false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Camera'),
        ),
        body: SafeArea(
          minimum: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _cameraPreviewWidget(context),
              _cameraControlWidget(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Display Camera preview.
  Widget _cameraPreviewWidget(context) {
    return !cameraController.value.isInitialized
        ? const Text(
            'Loading',
            style: TextStyle(
              color: kWhiteColor,
              fontSize: 20.0,
              fontWeight: FontWeight.w900,
            ),
          )
        : CameraPreview(cameraController);
  }

  /// Display the control bar with buttons to take pictures
  Widget _cameraControlWidget(BuildContext context) {
    CameraDescription selectedCamera;
    CameraLensDirection lensDirection = CameraLensDirection.back;
    if (cameras.isNotEmpty) {
      selectedCamera = cameras[selectedCameraIndex];
      lensDirection = selectedCamera.lensDirection;
    }

    return Expanded(
      child: Align(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            FloatingActionButton.extended(
              heroTag: 'camera_flashbutton',
              onPressed: () {
                setState(() {
                  flashOn = !flashOn;
                });
                if (flashOn) {
                  cameraController.setFlashMode(FlashMode.torch);
                } else {
                  cameraController.setFlashMode(FlashMode.off);
                }
              },
              label: !flashOn
                  ? const Icon(Icons.flash_on)
                  : const Icon(Icons.flash_off),
            ),
            FloatingActionButton.extended(
                backgroundColor:
                    cameraButtonPressed ? Colors.grey : kPrimaryColor,
                heroTag: 'camera_recbutton',
                onPressed: cameraButtonPressed
                    ? null
                    : () {
                        setState(() {
                          cameraButtonPressed = true;
                        });
                        onCapturePressed(context);
                      },
                label: const Icon(Icons.camera)),
            if (!widget.disableCameraSwitch)
              FloatingActionButton.extended(
                heroTag: 'camera_switch',
                onPressed: _onSwitchCamera,
                label: Icon(
                  _getCameraLensIcon(lensDirection),
                  size: 24,
                ),
              ),
          ],
        ),
      ),
    );
  }

  IconData _getCameraLensIcon(CameraLensDirection direction) {
    switch (direction) {
      case CameraLensDirection.back:
        return CupertinoIcons.switch_camera;
      case CameraLensDirection.front:
        return CupertinoIcons.switch_camera_solid;
      case CameraLensDirection.external:
        return Icons.camera;
      default:
        return Icons.device_unknown;
    }
  }

  void _showCameraException(CameraException e) {
    errorLog('Camera Exception: $e');
  }

  storeFile(XFile file, context) async {
    fileName = file.name;
    filePath = join(appAttachmentsDir, fileName);
    debugPrint('filePath===$filePath');
    await file.saveTo(filePath);
    Navigator.of(this.context).pop(filePath);
  }

  popScreen(context) {
    cameraButtonPressed = false;
    Navigator.of(this.context).pop('0');
  }

  onCapturePressed(BuildContext context) async {
    try {
      if (cameraController.value.isInitialized) {
        XFile image = await cameraController.takePicture();
        if (await image.length() != 0) {
          fileName = image.name;
          filePath = join(appAttachmentsDir, fileName);
          await image.saveTo(filePath);

          if (!mounted) return;
          Navigator.of(context).pop(filePath);
        }
      } else {
        showFlutterToastMsg("Error while opening camera!", kRedColor);
        popScreen(context);
      }
    } catch (e) {
      errorLog('Camera onCapturePressed(): $e');
      popScreen(context);
    }
  }

  void _onSwitchCamera() {
    selectedCameraIndex =
        selectedCameraIndex < cameras.length - 1 ? selectedCameraIndex + 1 : 0;
    CameraDescription selectedCamera = cameras[selectedCameraIndex];
    _initCameraController(selectedCamera);
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }
}
