import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isButtonEnabled = false;
  bool _passwordError = false;
  late AnimationController _controller;
  FocusNode _passwordFocusNode = FocusNode();
  bool _isObscured = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _passwordFocusNode.addListener(_onPasswordFocusChange);
  }

  void _onPasswordFocusChange() {
    setState(() {
      if (!_passwordFocusNode.hasFocus) {
        _passwordError = !_hasRequiredPassword(_passwordController.text);
      } else {
        _passwordError = false;
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _passwordFocusNode.removeListener(_onPasswordFocusChange);
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], // Set the background color
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Animate Login Page',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
                controller: _passwordController,
                obscureText: _isObscured,
                focusNode: _passwordFocusNode,
                decoration: InputDecoration(
                  labelText: 'Password',
                  helperText: _passwordError
                      ? 'At least one upper case letter, one lower case letter, one digit, one special character, minimum eight characters.'
                      : null,
                  errorText: _passwordError ? 'Invalid password' : null,
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscured ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: _togglePasswordVisibility,
                  ),
                  border: OutlineInputBorder(),
                ),
                onChanged: _checkButtonEnable,
              ),
            ),
            const SizedBox(height: 16.0),
            GestureDetector(
              onTapUp: (details) => _onTap(details.globalPosition),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 120),
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    double offsetValue = _controller.value *
                        (50 - 25 + MediaQuery.of(context).size.width);
                    offsetValue = offsetValue.clamp(
                        0, MediaQuery.of(context).size.width - 80.0);
                    return Transform.translate(
                      offset: _isButtonEnabled
                          ? Offset(0, 0)
                          : Offset(offsetValue, 0),
                      child: ElevatedButton(
                        onPressed: _isButtonEnabled ? _loginPressed : null,
                        style: ElevatedButton.styleFrom(
                          primary:
                              Colors.orange, // Change the button color here
                          minimumSize: const Size(50.0, 40.0),
                          padding: EdgeInsets.zero,
                        ),
                        child: Center(
                          child: const Text(
                            'Login',
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _checkButtonEnable(String password) {
    setState(() {
      _passwordError = !_hasRequiredPassword(password);

      _isButtonEnabled = !_passwordError && password.length >= 6;
      if (_isButtonEnabled) {
        _controller.stop();
      } else {
        _controller.repeat(reverse: true);
      }
    });
  }

  bool _hasRequiredPassword(String password) {
    final RegExp regex = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
    );
    return regex.hasMatch(password);
  }

  void _onTap(Offset globalPosition) {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var localPosition = renderBox.globalToLocal(globalPosition);

    setState(() {
      _controller.forward(
        from: localPosition.dx < renderBox.size.width / 2 ? 0.0 : 0.5,
      );
    });
  }

  void _loginPressed() {
    print('Email: ${_emailController.text}');
    print('Password: ${_passwordController.text}');
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }
}
