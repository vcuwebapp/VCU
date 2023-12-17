import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraView extends StatefulWidget {
  const CameraView({super.key});

  @override
  State<CameraView> createState() => CameraViewState();
}

class CameraViewState extends State<CameraView> {
  CameraController camController = CameraController(
      const CameraDescription(
          name: '',
          lensDirection: CameraLensDirection.front,
          sensorOrientation: 1),
      ResolutionPreset.max,
      enableAudio: false);

  @override
  void initState() {
    super.initState();
    camController.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Flex(
      direction: Axis.vertical,
      children: [
        cameraPreview(),
        captureButtons(),
      ],
    ));
  }

  cameraPreview() {
    return camController.buildPreview();
  }

  captureButtons() {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              previewImage();
            },
            icon: const Icon(Icons.camera))
      ],
    );
  }
}

void previewImage() {}
