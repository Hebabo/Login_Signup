import 'package:flutter/material.dart';
import '../widgets/app_text_form_field.dart';
import 'signin_screen.dart';
import '../utils/app_colors.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _SignUpState();
}

class _SignUpState extends State<LogIn> {
  final _formKey = GlobalKey<FormState>();
  String? _nameError;
  String? _passwordError;
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _validateAndLogin() {
    setState(() {
      _nameError = _nameController.text.isEmpty
          ? 'Please enter your username'
          : null;
      _passwordError = _passwordController.text.isEmpty
          ? 'Please enter your password'
          : null;
    });

    if (_nameError == null && _passwordError == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Logging in...')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: Column(
                children: [
                  Text(
                    'Welcome Back',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  Text('Login', style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
            ),
            Form(
              key: _formKey, // <-- Wrap fields in Form
              child: Container(
                width: 300,

                child: Column(
                  spacing: 15,
                  children: [
                    AppTextField(
                      controller: _nameController,
                      prefixIcon: Icon(Icons.person),
                      textContent: 'Username',
                    ),
                    if (_nameError != null)
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 4.0),
                        child: Text(
                          _nameError!,
                          style: TextStyle(
                            color: AppColors.secondaryColor,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    AppTextField(
                      controller: _passwordController,
                      prefixIcon: Icon(Icons.lock),
                      textContent: 'Password',
                      obscureText: true,
                    ),
                    if (_passwordError != null)
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 4.0),
                        child: Text(
                          _passwordError!,
                          style: TextStyle(
                            color: AppColors.secondaryColor,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ElevatedButton(
                      onPressed: _validateAndLogin,
                      child: Text('LOGIN'),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              'Forgot Password?',
              style: TextStyle(color: AppColors.mainColor),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don\'t have an account?'),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignIn()),
                    );
                  },
                  child: Text('Sign Up'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
