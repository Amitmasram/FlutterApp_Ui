import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import '../../core/services/snackbar_service.dart';
import '../../core/widgets/custom_text_form_field.dart';
import '../../pages/login_view/login_view_model.dart';

class ResetPasswordView extends StatelessWidget {
  static const String routeName = 'reset-password-view';
  final formKey = GlobalKey<FormState>();
  final LoginViewModel? vm;

  ResetPasswordView({
    super.key,
    required this.vm,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return ChangeNotifierProvider.value(
      value: vm,
      child: Container(
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
            title: Text('Login', style: theme.textTheme.titleLarge),
            centerTitle: true,
            toolbarHeight: 120,
          ),
          body: Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.18,
              left: 20,
              right: 20,
            ),
            child: SingleChildScrollView(
              child: Consumer<LoginViewModel>(
                builder: (context, vm, child) {
                  return Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Forgot Password',
                          style: theme.textTheme.titleLarge!
                              .copyWith(color: theme.colorScheme.onSecondary),
                        ),
                        const SizedBox(height: 40),
                        CustomTextFormField(
                          title: 'Enter your email',
                          textEditingController: vm.emailForResetPassword,
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
                        const SizedBox(height: 50),
                        MaterialButton(
                          onPressed: () async {
                            EasyLoading.show();
                            await vm.resetPassword(formKey);
                            EasyLoading.dismiss();

                            if (vm.resetPasswordStatus == "success") {
                              SnackBarService.showSuccessMessage(
                                  'A password reset link has been sent to your email');
                              Timer(const Duration(seconds: 3), () {Navigator.pop(context);});
                            } else {
                              SnackBarService.showErrorMessage(
                                  '${vm.resetPasswordStatus}');
                            }
                          },
                          height: 50,
                          color: theme.colorScheme.primary,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Reset Password',
                                style: theme.textTheme.bodyLarge!.copyWith(
                                    color: theme.colorScheme.secondary,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Icon(Icons.arrow_forward_rounded)
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
