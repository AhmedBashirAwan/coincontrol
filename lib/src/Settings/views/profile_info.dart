import 'dart:io' as io;

import 'package:coincontrol/imports.dart';
import 'package:coincontrol/src/Settings/controllers/settings_controller.dart';
import 'package:image_picker/image_picker.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  bool nameReadyOnly = true;
  // bool emailReadyOnly = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  Map<String, dynamic> credentials = {};
  XFile? image;

  Future<void> _pickImage(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    final img = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      image = img;
    });
  }

  @override
  void initState() {
    super.initState();
    SettingsController().fetchingUsersCredentials();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: const Text(
          'Edit Profile',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor:
            isDarkTheme(context) == true ? Colors.black : LIGHT_SEC_COLOR,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: FutureBuilder(
              future: SettingsController().fetchingUsersCredentials(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  Map<String, dynamic>? data = snapshot.data;
                  return Column(
                    children: [
                      SizedBox(
                        height: getHeight(context) * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                              onTap: () {
                                _pickImage(ImageSource.gallery);
                              },
                              child: Tooltip(
                                message: "Edit Image",
                                child: CircleAvatar(
                                  backgroundColor: image == null
                                      ? Colors.grey
                                      : Colors.transparent,
                                  radius: 50,
                                  backgroundImage: image == null
                                      ? null
                                      : FileImage(io.File(image!.path)),
                                  child: image == null
                                      ? Text(
                                          data!['name']?[0] ?? 'N/A',
                                          style: const TextStyle(
                                            fontSize: 28,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )
                                      : null,
                                ),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: getHeight(context) * 0.01,
                      ),
                      const Row(
                        children: [
                          Text(
                            "Name",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[a-zA-Z]+|\s'))
                        ],
                        controller: nameController,
                        readOnly: nameReadyOnly,
                        decoration: InputDecoration(
                          hintText: data!['name'],
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                nameReadyOnly = false;
                              });
                            },
                            child: const Icon(
                              Icons.edit,
                              size: 20,
                            ),
                          ),
                          filled: true,
                          labelStyle: TextStyle(
                              color: isDarkTheme(context) == true
                                  ? Colors.white
                                  : Colors.black),
                          fillColor: isDarkTheme(context) == true
                              ? Colors.black54
                              : Colors.grey[300],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Row(
                        children: [
                          Text(
                            "Email",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        controller: emailController,
                        readOnly: true,
                        decoration: InputDecoration(
                          hintText: data['email'],
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                // emailReadyOnly = false;
                              });
                            },
                            child: const Icon(
                              Icons.edit,
                              size: 20,
                            ),
                          ),
                          filled: true,
                          labelStyle: TextStyle(
                              color: isDarkTheme(context) == true
                                  ? Colors.white
                                  : Colors.black),
                          fillColor: isDarkTheme(context) == true
                              ? Colors.black54
                              : Colors.grey[300],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              FIRE_BASE.sendPasswordResetEmail(
                                  email: data['email']);
                            },
                            child: const Text(
                              'Forget Password?',
                              style: TextStyle(
                                  // color: isDarkTheme(context)==true?Colors.,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: getHeight(context) * 0.05,
                      ),
                      SizedBox(
                        width: getWidth(context) * 0.4,
                        child: CustomElevatedBtn(
                          height: getHeight(context) * 0.06,
                          radius: 18,
                          foregroundColor: LIGHT_COLOR,
                          backgroundColor: LIGHT_SEC_COLOR,
                          child: const Text(
                            'Update',
                            style: TextStyle(fontSize: 18),
                          ),
                          onPressed: () async {
                            Map<String, dynamic> payload = {
                              'name': nameController.text.isEmpty
                                  ? data['name']
                                  : nameController.text.trim(),
                              'email': data['email'],
                            };
                            SettingsController().editingProfile(payload);
                          },
                        ),
                      ),
                    ],
                  );
                }
              }),
        ),
      )),
    );
  }
}
