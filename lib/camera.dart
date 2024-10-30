import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class Camera extends StatefulWidget {
  const Camera({super.key});

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  List<CameraDescription> cameras = [];
  CameraController? cameraController;
  int _selectedCameraIndex = 0;
  bool _isFlashOn = false;
  Offset? _focusPoint;
  double _currentZoom = 1.00;
  File? _capturedImage;

  @override
  void initState() {
    super.initState();
    _setupCameraController();
  }

  void _toggleFlashLight() {
    if (cameraController != null && cameraController!.value.isInitialized) {
      if (_isFlashOn) {
        cameraController?.setFlashMode(FlashMode.off);
        setState(() {
          _isFlashOn = false;
        });
      } else {
        cameraController?.setFlashMode(FlashMode.torch);
        setState(() {
          _isFlashOn = true;
        });
      }
    }
  }

  Future<void> _switchCamera() async {
    if (cameras.length > 1) {
      _selectedCameraIndex = _selectedCameraIndex == 0 ? 1 : 0;
      await cameraController?.dispose();
      cameraController = CameraController(
        cameras[_selectedCameraIndex],
        ResolutionPreset.high,
      );
      await cameraController?.initialize();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 80,
              left: 25,
              right: 25,
              child: Container(
                height: 366,
                width: 380,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xFFD9D9D9),
                  border: Border.all(color: const Color(0xFFF24E1E), width: 2),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: cameraController != null &&
                                cameraController!.value.isInitialized
                            ? CameraPreview(cameraController!)
                            : const Center(child: CircularProgressIndicator()),
                      ),
                      Positioned(
                        top: 10,
                        left: 10,
                        child: GestureDetector(
                          onTap: _toggleFlashLight,
                          child: Icon(
                            _isFlashOn ? Icons.flash_on : Icons.flash_off,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        right: 10,
                        child: GestureDetector(
                          onTap: _switchCamera,
                          child: const Icon(
                            Icons.cameraswitch,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 20,
              left: 21,
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Translate',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _setupCameraController() async {
    cameras = await availableCameras();
    if (cameras.isNotEmpty) {
      cameraController = CameraController(
        cameras[_selectedCameraIndex],
        ResolutionPreset.high,
      );
      try {
        await cameraController?.initialize();
        setState(() {});
      } catch (e) {
        print("Error initializing camera: $e");
      }
    }
  }

  @override
  void dispose() {
    cameraController?.dispose();
    super.dispose();
  }
}
