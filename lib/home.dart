import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();

}

class _HomeState extends State<Home> {

  File? _image;

  final imagepicker = ImagePicker();

  Future getImage() async{
    final image = await imagepicker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(image!.path);
    });
      }

  checkPermission(){
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("This Permission is Recommended.")));
  }

  requestFilePermission() async {

    PermissionStatus storage = await Permission.storage.request();

      if (storage == PermissionStatus.denied) {
        checkPermission();
      }

      if (storage == PermissionStatus.permanentlyDenied) {

        openAppSettings();
      }

  }

  @override
  void initState() {
    requestFilePermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity 5'),
      ),

      body: Center(
        child: CircleAvatar(
          radius: 150,
          backgroundColor: Colors.grey.shade300,
          child: ClipOval(
            child: _image == null
                ? Center(
                child: Text('No Image Selected')
            )
                : Image.file(
              _image!,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: getImage,
        child: const Icon(Icons.image),
      ),
    );
  }
}
