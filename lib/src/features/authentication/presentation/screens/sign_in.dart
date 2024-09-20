import 'package:flutter/material.dart' as m3;

import 'package:appwrite/appwrite.dart';
import 'package:fluent_ui/fluent_ui.dart';

import 'package:admin/src/core/core.dart';
import 'package:admin/src/dependency_injector.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInForm();
}

class _SignInForm extends State<SignInScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final bool _isPasswordVisible = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      content: Center(
        child: Form(
          key: _formkey,
          child: Container(
            width: 440,
            padding: const EdgeInsets.all(30.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                m3.Material(
                  child: m3.TextField(
                    controller: _emailController,
                    decoration: const m3.InputDecoration(
                        border: m3.OutlineInputBorder(), labelText: "Email"),
                  ),
                ),
                const m3.SizedBox(height: 16),
                m3.Material(
                  child: m3.TextField(
                    controller: _passwordController,
                    decoration: const m3.InputDecoration(
                        border: m3.OutlineInputBorder(), labelText: "Password"),
                  ),
                ),
                const m3.SizedBox(height: 16),
                Button(
                    child: const Text("Sign In"),
                    onPressed: () async {
                      try {
                        final user = await account.createEmailPasswordSession(
                            email: _emailController.text,
                            password: _passwordController.text);

                        if (user.current) {
                          Navigator.push(
                              context,
                              FluentPageRoute(
                                  builder: (context) =>
                                      const SidePaneEntity()));
                        }
                      } on AppwriteException catch (e) {
                        print(e);
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
