import 'package:flutter/material.dart';
import 'package:omniview/common/widgets/app_grandient.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(gradient: AppGradients.background),
      ),
    );
  }
}
