import 'package:flutter/material.dart';
import '../../core/network_layer/firebase_utils.dart';

class RegisterViewModel extends ChangeNotifier {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  String? _registrationStatus = "";

  GlobalKey<FormState>? get formKey => _formKey;
  TextEditingController? get fullName => _fullName;
  TextEditingController? get email => _email;
  TextEditingController? get password => _password;
  TextEditingController? get confirmPassword => _confirmPassword;
  String? get registrationStatus => _registrationStatus;

  register() async {
    if (_formKey.currentState!.validate()) {
      // call api to register
      var response = await FirebaseUtils.register(_email.text, _password.text);
      response.fold((l) {
        _registrationStatus = l;
      }, (r) {
        _registrationStatus = "success";
      });
    }
    if (_registrationStatus!.isEmpty) _registrationStatus = "invalid";
    notifyListeners();
  }
}
