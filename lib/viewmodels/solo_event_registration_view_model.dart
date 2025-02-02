
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class SoloEventRegistrationViewModel extends BaseViewModel{
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController=TextEditingController();
  TextEditingController idController=TextEditingController();
  TextEditingController contactNumberController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  Future<void> onSubmit()async{
    print(nameController.text);
    print(idController.text);
    print(emailController.text);
    print(contactNumberController.text);

  }
}