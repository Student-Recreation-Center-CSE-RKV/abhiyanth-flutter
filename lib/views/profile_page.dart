import 'package:abhiyanth/widgets/gradient_border.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../services/size_config.dart';
import '../utilities/gradient_background.dart';
import 'package:image_picker/image_picker.dart';
import 'package:abhiyanth/services/custom_snackbar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final List<String> branches = ['CSE', 'ECE', 'EEE', 'Mechanical', 'Civil', 'Chemical', 'MME'];
  String selectedBranch = 'CSE';

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController batchController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController idcontroller =TextEditingController();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late final String userId;
  bool isLoading = false; // For showing the loading indicator

  @override
  void initState() {
    super.initState();
    User? user = FirebaseAuth.instance.currentUser;
    userId = user?.uid ?? 'unknown_user';
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    setState(() {
      isLoading = true; // Start loading
    });
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
      await _firestore.collection('Users').doc(userId).get();

      if (snapshot.exists) {
        Map<String, dynamic>? data = snapshot.data();
        setState(() {
          nameController.text = data?['name'] ?? '';
          idcontroller.text = data?['id'] ?? '';
          emailController.text = data?['email'] ?? '';
          batchController.text = data?['batch'] ?? '';
          mobileController.text = data?['mobile'] ?? '';
          selectedBranch = data?['branch'] ?? 'CSE';
        });
      }
    } catch (e) {
      CustomSnackBar.show(context, 'Failed to load profile data: $e');
    } finally {
      setState(() {
        isLoading = false; // Stop loading
      });
    }
  }

  Future<void> _saveProfileData() async {
    await _firestore.collection('Users').doc(userId).set({
      'name': nameController.text,
      'id' : idcontroller.text,
      'email': emailController.text,
      'batch': batchController.text,
      'mobile': mobileController.text,
      'branch': selectedBranch,
    },SetOptions(merge: true));
    CustomSnackBar.show(context, 'Profile saved successfully!');
  }
  // Future<void> getImage() async{
  //   final ImagePicker picker=ImagePicker();
  //   final XFile? pickedFile = await picker.pickImage(
  //     source: ImageSource.gallery,
  //     maxWidth: 800,
  //     maxHeight: 800,
  //     imageQuality: 80,
  //   );
  //
  //
  // }
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return GradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: isLoading
            ? Center(
          child: CircularProgressIndicator(
            color: Colors.blue,
          ),
        )
            : SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.blockSizeHorizontal * 5),
            child: Column(
              children: [
                const SizedBox(height: 20),
                BorderGradient(
                  borderRadius: BorderRadius.circular(20.0),
                  borderWidth: 3.0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.safeBlockVertical * 1.0,
                      horizontal: SizeConfig.safeBlockHorizontal * 15,
                    ),
                    child: Text(
                      "My Profile",
                      style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 5,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: SizeConfig.blockSizeVertical * 10,
                      backgroundColor: Colors.purple,
                    ),
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        padding: const EdgeInsets.all(5),
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                _buildTextField("Name", nameController),
                const SizedBox(height: 15),
                _buildTextField("ID",idcontroller),
                const SizedBox(height: 15),
                _buildTextField("Email", emailController),
                const SizedBox(height: 15),
                _buildTextField("Batch", batchController),
                const SizedBox(height: 15),

                // Dropdown for Branch Selection
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Branch",
                      style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 4,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.blue, width: 1),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: DropdownButton<String>(
                        value: selectedBranch,
                        isExpanded: true,
                        dropdownColor: Colors.black,
                        icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                        underline: const SizedBox(),
                        items: branches.map((String branch) {
                          return DropdownMenuItem<String>(
                            value: branch,
                            child: Text(
                              branch,
                              style: const TextStyle(color: Colors.white),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedBranch = newValue!;
                          });
                        },
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 15),
                _buildTextField("Mobile", mobileController),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.blockSizeVertical * 1.0,
                      horizontal: SizeConfig.blockSizeHorizontal * 10,
                    ),
                  ),
                  onPressed: () async {
                    await _saveProfileData();
                    await _loadProfileData();
                  },
                  child: const Text(
                    "Save Changes",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: SizeConfig.safeBlockHorizontal * 4,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.blue, width: 1),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              controller: controller,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
