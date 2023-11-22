
import 'package:coincontrol/imports.dart';
import 'package:coincontrol/src/dashboard/controllers/dashboardController.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  bool nameReadyOnly = true;
  bool emailReadyOnly = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  Map<String, dynamic> credentials = {};
  @override
  void initState() {
    super.initState();
    fetchingUsersCredentials();
  }

  Future<Map<String, dynamic>> fetchingUsersCredentials() async {
    QuerySnapshot<Map<String, dynamic>> userData = await FIRE_STORE
        .collection('userCredentials')
        .where("user_ID", isEqualTo: USER_ID)
        .get();

    if (userData.docs.isNotEmpty) {
      print(userData.docs.first.data());
      setState(() {
        credentials = userData.docs.first.data();
      });
      return userData.docs.first.data();
    } else {
      // Handle the case where no document is found for the given user ID.
      print("No document found for user ID: $USER_ID");
      return {}; // or null, depending on how you want to handle this case
    }
  }

  Future<void> editingProfile({String? name, String? email}) async {
    // Get the current user's document reference
    QuerySnapshot<Map<String, dynamic>> data = await FirebaseFirestore.instance
        .collection('userCredentials')
        .where('user_ID', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();

    QueryDocumentSnapshot<Map<String, dynamic>> document = data.docs.first;

    // Update the document with the new values
    if (name != null) {
      document.reference.update({'name': name});
    }

    if (email != null) {
      document.reference.update({'email': email});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        // toolbarHeight: getHeight(context) * 0.03,
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
          child: Column(
            children: [
              SizedBox(
                height: getHeight(context) * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 40,
                    child: Text(
                      credentials['name']?[0] ?? 'N/A',
                      style: const TextStyle(
                          fontSize: 28, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: getHeight(context) * 0.01,
              ),
              Row(
                children: const [
                  Text(
                    "Name",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: nameController,
                readOnly: nameReadyOnly,
                decoration: InputDecoration(
                  hintText: credentials['name'],
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
              Row(
                children: const [
                  Text(
                    "Email",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: emailController,
                readOnly: emailReadyOnly,
                decoration: InputDecoration(
                  hintText: credentials['email'],
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        emailReadyOnly = false;
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
                          email: credentials['email']);
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
                    editingProfile(
                        email: emailController.text.trim(),
                        name: nameController.text.trim());
                  },
                ),
              ),
              
            ],
          ),
        ),
      )),
    );
  }
}
