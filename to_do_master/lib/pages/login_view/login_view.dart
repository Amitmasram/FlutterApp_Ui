import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import '../../core/services/snackbar_service.dart';
import '../../core/widgets/custom_text_form_field.dart';
import '../../layout/home_layout.dart';
import '../../pages/login_view/login_view_model.dart';
import '../../pages/register_view/register_view.dart';
import '../../pages/login_view/reset_password_view.dart';

class LoginView extends StatefulWidget {
  static const String routeName = 'login-view';

  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late LoginViewModel loginViewModel;
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    loginViewModel = LoginViewModel();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return ChangeNotifierProvider(
      create: (context) => loginViewModel,
      builder: (context, child) {
        return Consumer<LoginViewModel>(
          builder: (context, vm, child) {
            return Container(
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
                    child: Form(
                      key: vm.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Welcome Back!',
                            style: theme.textTheme.titleLarge!
                                .copyWith(color: theme.colorScheme.onSecondary),
                          ),
                          const SizedBox(height: 40),
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
                            title: 'Enter your password',
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
                                return 'invalid password';
                              }

                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: TextButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => ResetPasswordView(vm: vm),
                                  ),
                                );
                              },
                              child: Text(
                                'Forget password ?',
                                textAlign: TextAlign.start,
                                style: theme.textTheme.bodyLarge!.copyWith(
                                    color: theme.colorScheme.onSecondary),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          MaterialButton(
                            onPressed: () async {
                              EasyLoading.show();
                              await loginViewModel.login();
                              EasyLoading.dismiss();

                              if (vm.loginStatus == "success") {
                                SnackBarService.showSuccessMessage(
                                    'You logged in successfully');
                                if (mounted) {
                                  Navigator.pushReplacementNamed(
                                      context, HomeLayout.routeName);
                                }
                              } else if (vm.loginStatus ==
                                  "invalid-credential") {
                                SnackBarService.showErrorMessage(
                                    'Invalid login credentials');
                              } else if (vm.loginStatus ==
                                  "email-not-verified") {
                                SnackBarService.showErrorMessage(
                                    'Email is not verified, please verify your email');
                              } else {
                                SnackBarService.showErrorMessage(
                                    'Something went wrong');
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
                                  'Login',
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
                                Navigator.pushNamed(
                                    context, RegisterView.routeName);
                              },
                              child: Text(
                                'OR Create new account !',
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
            );
          },
        );
      },
    );
  }
}
