import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  String? _nameError;
  String? _emailError;
  String? _passwordError;
  String? _confirmPasswordError;

  void _validateAndSignUp() {
    setState(() {
      _nameError = _nameController.text.isEmpty
          ? 'Please enter a username'
          : null;
      _emailError = _emailController.text.isEmpty
          ? 'Please enter an email'
          : (!_emailController.text.contains('@')
                ? 'Enter a valid email'
                : null);
      _passwordError = _passwordController.text.isEmpty
          ? 'Please enter a password'
          : null;
      _confirmPasswordError = _confirmPasswordController.text.isEmpty
          ? 'Please confirm your password'
          : (_confirmPasswordController.text != _passwordController.text
                ? 'Passwords do not match'
                : null);
    });

    if (_nameError == null &&
        _emailError == null &&
        _passwordError == null &&
        _confirmPasswordError == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Signing up...')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // <-- Wrap with Center
        child: SingleChildScrollView(
          // <-- Prevent overflow on small screens
          child: Column(
            spacing: 30,
            mainAxisAlignment: MainAxisAlignment.center, // Center vertically
            crossAxisAlignment:
                CrossAxisAlignment.center, // Center horizontally
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Sign up',
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('Create an account', style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),
              Container(
                width: 300,
                child: Column(
                  spacing: 15,
                  children: [
                    // Username
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
                    // Email
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 223, 218, 231),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(8),
                          hintText: 'Email',
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.mail),
                        ),
                      ),
                    ),
                    if (_emailError != null)
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 4.0),
                        child: Text(
                          _emailError!,
                          style: TextStyle(color: Colors.red, fontSize: 12),
                        ),
                      ),
                    // Password
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
                    // Confirm Password
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 223, 218, 231),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        controller: _confirmPasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(8),
                          hintText: 'Confirm Password',
                          prefixIcon: Icon(Icons.lock),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    if (_confirmPasswordError != null)
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 4.0),
                        child: Text(
                          _confirmPasswordError!,
                          style: TextStyle(color: Colors.red, fontSize: 12),
                        ),
                      ),
                    ElevatedButton(
                      onPressed: _validateAndSignUp,
                      child: Text('Sign up'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color.fromARGB(
                          255,
                          113,
                          94,
                          146,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 15,
                        ),
                      ),
                    ),
                    Text('or', style: TextStyle(color: Colors.blue)),
                    ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Signing in with Google...')),
                        );
                      },
                      child: Text('Sign in with Google'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color.fromARGB(
                          255,
                          113,
                          94,
                          146,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 15,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already have an account?'),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Login'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
