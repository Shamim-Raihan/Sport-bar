import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sports_bar/controllers/profile_controller.dart';
import 'package:sports_bar/main_page.dart';
import 'package:sports_bar/widgets/app_navigation.dart';

class EditProfile extends StatelessWidget {
  EditProfile({Key? key}) : super(key: key);
  final Box _box = Hive.box("userData");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF2E9E5E),
          centerTitle: true,
          title: Text("Edit Profile"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: GetBuilder<ProfileController>(
                init: ProfileController(),
                builder: (controller) {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 110,
                            width: 110,
                            child: Stack(
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundColor: const Color(0xFF2E9E5E),
                                  backgroundImage:
                                      _box.get("profilePic") == null
                                          ? const AssetImage(
                                              "assets/images/profile.png")
                                          : FileImage(
                                              File(
                                                _box.get("profilePic"),
                                              ),
                                            ) as ImageProvider,
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.grey,
                                    child: IconButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                          context: context,
                                          builder: (context) {
                                            return Container(
                                              height: 150,
                                              color: Color(0xFF2E9E5E),
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 60,
                                                    width: double.maxFinite,
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: ListTile(
                                                            onTap: () {
                                                              Navigator.pop(
                                                                  context);
                                                              controller.pickImage(
                                                                  ImageSource
                                                                      .camera);
                                                            },
                                                            leading: const Icon(
                                                              Icons.camera,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            title: const Text(
                                                              "Camera",
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: ListTile(
                                                            onTap: () {
                                                              Navigator.pop(
                                                                  context);
                                                              controller
                                                                  .deleteImage();
                                                            },
                                                            leading: const Icon(
                                                              Icons.delete,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            title: const Text(
                                                              "Delete Image",
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  ListTile(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                      controller.pickImage(
                                                          ImageSource.gallery);
                                                    },
                                                    leading: const Icon(
                                                      Icons
                                                          .photo_album_outlined,
                                                      color: Colors.white,
                                                    ),
                                                    title: const Text(
                                                      "Gallery",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      icon: Icon(
                                        Icons.camera_alt_outlined,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            controller: controller.userName,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                              fillColor: Colors.grey.withOpacity(0.6),
                              filled: true,
                              hintText: "UserName",
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            controller: controller.country,
                            readOnly: true,
                            onTap: () => controller.selectCountry(context),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                              fillColor: Colors.grey.withOpacity(0.6),
                              filled: true,
                              hintText: "Country",
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            readOnly: true,
                            controller: controller.dob,
                            onTap: () => controller.selectDOB(context),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                              fillColor: Colors.grey.withOpacity(0.6),
                              filled: true,
                              hintText: "Date of Birth (Optional)",
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Container(
                            width: 250,
                            height: 45,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith(
                                  (states) => Color(0xFF2E9E5E),
                                ),
                              ),
                              onPressed: () async {
                                if (controller.userName.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("Please Enter userName!"),
                                    ),
                                  );
                                } else if (controller.userName.text.length <
                                    3) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          "Please enter atleast three characters!"),
                                    ),
                                  );
                                } else {
                                  await _box.put(
                                    "profileData",
                                    {
                                      "userName": controller.userName.text,
                                      "dob": controller.dob.text,
                                      "email": controller.email.text.toString(),
                                      "countryName": controller.country.text,
                                      "imagePath": controller.imagePath.text,
                                    },
                                  );
                                  AppNavigation.ofAll(
                                    context,
                                    MainPage(),
                                  );
                                }
                              },
                              child: Text(
                                "Update",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
