import 'dart:io';

import 'package:famliciousapp/managers/auth/auth_manager.dart';
import 'package:famliciousapp/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:unicons/unicons.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final AuthManager _authManager = AuthManager();

  bool _isLoading = false;

  final ImagePicker _imagePicker = ImagePicker();
  File? _imageFile;

  Future selectImage({ImageSource imageSource = ImageSource.camera}) async {
    XFile? selectedFile = await _imagePicker.pickImage(source: imageSource);
    // File imageFile = File(selectedFile!.path);

    File? croppedFile = await ImageCropper.cropImage(
        sourcePath: selectedFile!.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        androidUiSettings: const AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: const IOSUiSettings(
          minimumAspectRatio: 1.0,
        ));

    setState(() {
      _imageFile = croppedFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Form(
            key: _formkey,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(90.0),
                  child: Image.asset(
                    "assets/upload.png",
                    height: 130,
                    width: 130,
                  ),
                ),
                TextButton.icon(
                    onPressed: () {
                      showBarModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 150,
                              child: Column(
                                children: [
                                  TextButton.icon(
                                    onPressed: () {
                                      selectImage(
                                          imageSource: ImageSource.camera);
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(UniconsLine.camera_plus,
                                        size: 35),
                                    label: const Text("Take from camera"),
                                  ),
                                  TextButton.icon(
                                    onPressed: () {
                                      selectImage(
                                          imageSource: ImageSource.gallery);
                                      Navigator.pop(context);
                                    },
                                    icon:
                                        const Icon(UniconsLine.image, size: 35),
                                    label: const Text("Select from gallery"),
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                    icon: const Icon(UniconsLine.camera),
                    label: const Text("Upload profile picture")),
                const SizedBox(height: 30.0),
                TextFormField(
                  controller: _nameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: "full name",
                    prefixIcon: const Icon(Icons.person),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: _emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: "Email",
                    prefixIcon: const Icon(Icons.email),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: _passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: "Password",
                    prefixIcon: const Icon(Icons.lock),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 26.0),
                _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : TextButton(
                        onPressed: () async {
                          if (_formkey.currentState!.validate()) {
                            setState(() {
                              _isLoading = true;
                            });

                            bool isSuccess = await _authManager.createAccount(
                              email: _emailController.text,
                              password: _passwordController.text,
                              fName: _nameController.text,
                              imageUrl: _imageFile!,
                            );

                            if (isSuccess) {
                              Fluttertoast.showToast(
                                  msg: "Account created Successful",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.green,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                              setState(() {
                                _isLoading = false;
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeView(),
                                ),
                              );
                            } else {
                              Fluttertoast.showToast(
                                  msg: "email or password is incorrect",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                              setState(() {
                                _isLoading = false;
                              });
                            }
                          }
                        },
                        child: const Text("Create Account",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.black,
                        ),
                      ),
              ],
            ),
          ),
        ));
  }
}
