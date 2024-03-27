import 'package:flutter/material.dart';
import 'package:mvvmapp/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
          onTap: () {
            Utils.flushBarErrorMessage('No internet connection', context);

            Utils.snackBar('No internet connection', context);
            Utils.toastmessage('No internet connection');
          },
          child: const Center(child: Text("Click"))),
    );
  }
}
