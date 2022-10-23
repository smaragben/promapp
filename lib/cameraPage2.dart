import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:promracing/profile.dart';
import 'package:promracing/services/auth.dart';
import 'package:promracing/user.dart';
import 'dart:developer';
import 'package:camera/camera.dart';

List<CameraDescription>? cameras;

class CamApp extends StatefulWidget {
  const CamApp({Key? key, required this.cameras}) : super(key: key);

  final List<CameraDescription>? cameras;
  @override
  _CamApp createState() => _CamApp();
}

class _CamApp extends State<CamApp> {
  CameraController? controller;
  String imagePath = "";
  @override
  void initState() {
    super.initState();
    controller = CameraController(cameras![1], ResolutionPreset.max);
    controller?.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  Future takePic() async {
    try {
      final image = await controller!.takePicture();
      setState(() {
        imagePath = image.path;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!controller!.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                width: 200,
                height: 200,
                child: AspectRatio(
                  aspectRatio: controller!.value.aspectRatio,
                  child: CameraPreview(controller!),
                ),
              ),
              TextButton(
                  onPressed: () async {
                    try {
                      final image = await controller!.takePicture();
                      setState(() {
                        imagePath = image.path;
                      });
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: Text("Take Photo")),
              if (imagePath != "")
                Container(
                    width: 300,
                    height: 300,
                    child: Image.file(
                      File(imagePath),
                    ))
            ],
          ),
        ),
      ),
    );
  }
}
