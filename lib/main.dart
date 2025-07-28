import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth/bloc/login_bloc/login_bloc.dart';
import 'utils/app_themes.dart';
import 'views/main_navigation.dart';
import 'auth/bloc/bloc_screens/counter_bloc/counter_bloc.dart';
import 'auth/bloc/bloc_screens/counter_screen_with_bloc.dart';
import '../auth/bloc/signup_bloc/signup_bloc.dart'; // <-- Add this
import 'views/Login_screen.dart'; // <-- Add your signup screen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterBloc()),
        BlocProvider(create: (context) => SignupBloc()), // <-- Add this
        BlocProvider(create: (context) => LoginBloc()), // <-- Add this
      ],
      child: MaterialApp(
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        home: MainNavigation(), 
      ),
    );
  }
}
