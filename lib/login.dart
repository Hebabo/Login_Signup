import 'package:flutter/material.dart';
import 'signin.dart';

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
                    style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                  ),
                  Text('Login', style: TextStyle(fontSize: 18)),
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
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 223, 218, 231),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(8),
                          hintText: 'Username',
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.person),
                        ),
                      ),
                    ),
                    if (_nameError != null)
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 4.0),
                        child: Text(
                          _nameError!,
                          style: TextStyle(color: Colors.red, fontSize: 12),
                        ),
                      ),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 223, 218, 231),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(8),
                          hintText: 'Password',
                          prefixIcon: Icon(Icons.lock),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    if (_passwordError != null)
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 4.0),
                        child: Text(
                          _passwordError!,
                          style: TextStyle(color: Colors.red, fontSize: 12),
                        ),
                      ),
                    SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: _validateAndLogin,
                      child: Text('LOGIN'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color.fromARGB(
                          255,
                          113,
                          94,
                          146,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 100,
                          vertical: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text('Forgot Password?', style: TextStyle(color: Colors.blue)),
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
