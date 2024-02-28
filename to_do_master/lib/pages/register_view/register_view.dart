import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

import '../../core/services/snackbar_service.dart';
import '../../core/widgets/custom_text_form_field.dart';
import '../../pages/register_view/register_view_model.dart';

class RegisterView extends StatefulWidget {
  static const String routeName = 'register-view';
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late RegisterViewModel registerViewModel;
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    registerViewModel = RegisterViewModel();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return ChangeNotifierProvider<RegisterViewModel>(
      create: (context) => registerViewModel,
      builder: (context, child) {
        return Consumer<RegisterViewModel>(
          builder: (context, vm, child) => Container(
            decoration: BoxDecoration(
              color: theme.colorScheme.background,
              image: const DecorationImage(
                image: AssetImage('assets/images/login_pattern.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                title:
                    Text('Create Account', style: theme.textTheme.titleLarge),
                centerTitle: true,
                toolbarHeight: 120,
                iconTheme: IconThemeData(color: theme.colorScheme.secondary),
              ),
              body: Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.18,
                  left: 20,
                  right: 20,
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: vm.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomTextFormField(
                          title: 'Enter your full name',
                          textEditingController: vm.fullName,
                          labelText: 'Full Name',
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'You must enter your full name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        CustomTextFormField(
                          title: 'Enter your email',
                          textEditingController: vm.email,
                          labelText: 'Email',
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'You must enter your e-mail address';
                            }

                            var regex = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

                            if (!regex.hasMatch(value)) {
                              return 'invalid e-mail address';
                            }

                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        CustomTextFormField(
                          title: 'Must contains A-Z, a-z, @-#-&.. , 1-9',
                          textEditingController: vm.password,
                          labelText: 'Password',
                          obscureText: !isVisible,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              isVisible = !isVisible;
                              setState(() {});
                            },
                            child: isVisible == true
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'You must enter your password';
                            }

                            var regex = RegExp(
                              r"(?=^.{8,}$)(?=.*[!@#$%^&*]+)(?![.\\n])(?=.*[A-Z])(?=.*[a-z]).*$",
                            );

                            if (!regex.hasMatch(value)) {
                              return 'Must contains A-Z, a-z, @-#-&.. , 1-9';
                            }

                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        CustomTextFormField(
                          title: 'Re enter your password',
                          textEditingController: vm.confirmPassword,
                          labelText: 'Confirm Password',
                          obscureText: !isVisible,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              isVisible = !isVisible;
                              setState(() {});
                            },
                            child: isVisible == true
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'You must enter your password';
                            }

                            var regex = RegExp(
                              r"(?=^.{8,}$)(?=.*[!@#$%^&*]+)(?![.\\n])(?=.*[A-Z])(?=.*[a-z]).*$",
                            );

                            if (!regex.hasMatch(value)) {
                              return 'Must contains A-Z, a-z, @-#-&.. , 1-9';
                            }

                            if (value != vm.password?.text) {
                              return "Passwords doesn't match";
                            }

                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        const SizedBox(
                          height: 25,
                        ),
                        MaterialButton(
                          onPressed: () async {
                            EasyLoading.show();
                            await vm.register();
                            if (vm.registrationStatus == "success") {
                              EasyLoading.dismiss();
                              SnackBarService.showSuccessMessage(
                                  'Success, Please verify your account from your Mail Box');
                              Timer(const Duration(seconds: 3), () {
                                Navigator.pop(context);
                              });
                            } else if (vm.registrationStatus ==
                                "email-already-in-use") {
                              EasyLoading.dismiss();

                              SnackBarService.showErrorMessage(
                                  'There is an account already existed for that email.');
                            }
                            EasyLoading.dismiss();
                          },
                          height: 50,
                          color: theme.colorScheme.primary,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Sign Up',
                                style: theme.textTheme.bodyLarge!.copyWith(
                                    color: theme.colorScheme.secondary,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Icon(Icons.arrow_forward_rounded)
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'OR Log in !',
                              textAlign: TextAlign.start,
                              style: theme.textTheme.bodyLarge!.copyWith(
                                  color: theme.colorScheme.onSecondary),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
