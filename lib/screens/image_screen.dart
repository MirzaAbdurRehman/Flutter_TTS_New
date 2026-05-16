import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {

  File? imageFile;
  final ImagePicker picker = ImagePicker();

  Future<void> requestPermission() async {
    await Permission.camera.request();
    await Permission.photos.request();
  }

  Future<void> pickImage(ImageSource source) async {
    await requestPermission();

    final XFile ? pickedImage = await picker.pickImage(
        source: source,
      imageQuality: 70,
    );

    if(pickedImage != null){
      setState(() {
        imageFile = File(pickedImage.path);
      });
    }
  }

  void showImagePickerOptions() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return SafeArea(
              child: Wrap(
                children: [
                  ListTile(
                    leading: Icon(Icons.camera_alt),
                    title: Text('Take a Photo'),
                    onTap: () {
                      Navigator.of(context).pop();
                      pickImage(ImageSource.camera);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.photo_library),
                    title: Text('Choose from Gallery'),
                    onTap: () {
                      Navigator.of(context).pop();
                      pickImage(ImageSource.gallery);
                    },
                  ),
                ],
              ),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.green,
      ),
      body:  Center(
        child: Stack(
          children: [
            CircleAvatar(
              radius: 80,
              backgroundColor: Colors.grey.shade300,
              backgroundImage: imageFile != null ? FileImage(imageFile!): null,
              child: imageFile == null ?
              Icon(Icons.person,size: 70,color: Colors.white,) : null,
            ),

            Positioned(
              bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: showImagePickerOptions,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      )
                    ),
                    child: Icon(Icons.edit,size: 20,color: Colors.white,),
                  ),
                ),
            )
          ],
        ),
      ),
    );
  }
}
