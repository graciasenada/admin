import 'package:flutter/material.dart' as m3;

import 'package:appwrite/appwrite.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fluent_ui/fluent_ui.dart';

import 'package:admin/src/core/core.dart';
import 'package:admin/src/dependency_injector.dart';
import 'package:admin/src/features/admin_authentication/presentation/screens/sign_up.dart';
import 'package:admin/src/features/admin_authentication/presentation/widgets/logo.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInForm();
}

class _SignInForm extends State<SignInScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final _emailController = m3.TextEditingController();
  final _passwordController = m3.TextEditingController();
  bool _isPasswordVisible = false;
  bool _isHoveringSignUp = false;
  bool _isLoading = false; // To show a loading indicator
  String? _errorMessage; // To show error messages

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      padding: EdgeInsets.zero,
      content: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFF95b1ae),
              Color(0xFFe8f3f1),
              Color(0xFF95b1ae),
            ],
          ),
        ),
        child: Center(
          child: Form(
            key: _formkey,
            child: Container(
              width: 450,
              padding: const EdgeInsets.all(40.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF2e5f5b).withOpacity(0.28),
                    blurRadius: 18,
                    offset: const Offset(8, 12),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const LogoWidget(height: 32),
                  const m3.SizedBox(height: 15),
                  // Email Input Field
                  m3.SizedBox(
                    height: 40,
                    child: m3.Material(
                      child: m3.TextField(
                        controller: _emailController,
                        decoration: m3.InputDecoration(
                          isDense: true,
                          labelText: "Email Address",
                          labelStyle: const m3.TextStyle(
                            color: Color(0xFF334B49),
                            fontFamily: 'Roboto',
                            fontSize: 15,
                            fontWeight: m3.FontWeight.w400,
                          ),
                          enabledBorder: m3.OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: const m3.BorderSide(
                              color: Color(0xFF95b1ae),
                              width: 0.75,
                            ),
                          ),
                          focusedBorder: m3.OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: const m3.BorderSide(
                              color: Color(0xFF334b49),
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const m3.SizedBox(height: 15),
                  // Password Input Field
                  m3.SizedBox(
                    height: 40,
                    child: m3.Material(
                      child: m3.TextField(
                        controller: _passwordController,
                        obscureText: !_isPasswordVisible,
                        decoration: m3.InputDecoration(
                          isDense: true,
                          labelText: "Password",
                          labelStyle: const m3.TextStyle(
                            color: Color(0xFF334B49),
                            fontFamily: 'Roboto',
                            fontSize: 15,
                            fontWeight: m3.FontWeight.w400,
                          ),
                          enabledBorder: m3.OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: const m3.BorderSide(
                              color: Color(0xFF95b1ae),
                              width: 0.75,
                            ),
                          ),
                          focusedBorder: m3.OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: const m3.BorderSide(
                              color: Color(0xFF334b49),
                              width: 1.0,
                            ),
                          ),
                          suffixIcon: m3.IconButton(
                            icon: Icon(
                              _isPasswordVisible
                                  ? EvaIcons.eyeOutline
                                  : EvaIcons.eyeOffOutline,
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  const m3.SizedBox(height: 16),
                  // Sign-In Button
                  Button(
                    onPressed: _isLoading
                        ? null
                        : () async {
                            if (_formkey.currentState?.validate() ?? false) {
                              setState(() {
                                _isLoading = true;
                                _errorMessage = null; // Reset error message
                              });
                              try {
                                // Attempt to create a session
                                await account.createEmailPasswordSession(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                );
                                Navigator.pushReplacement(
                                  context,
                                  FluentPageRoute(
                                    builder: (context) => const SidePane(),
                                  ),
                                );
                              } on AppwriteException catch (e) {
                                setState(() {
                                  _errorMessage = e.message ?? "Unknown error";
                                });
                              } finally {
                                setState(() {
                                  _isLoading = false;
                                });
                              }
                            }
                          },
                    child: _isLoading
                        ? const ProgressRing() // Loading indicator when signing in
                        : const Text(
                            "Sign In",
                            style: m3.TextStyle(
                              fontFamily: 'Arial',
                            ),
                          ),
                  ),
                  const m3.SizedBox(height: 16),
                  // Error Message Display
                  if (_errorMessage != null)
                    m3.Text(
                      _errorMessage!,
                      style: const m3.TextStyle(
                        color: m3.Colors.redAccent,
                        fontSize: 12,
                      ),
                    ),
                  const m3.SizedBox(height: 16),
                  // Sign-Up Option
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const m3.Text(
                        "Don't have an account?",
                        style: m3.TextStyle(
                          color: m3.Colors.blueGrey,
                        ),
                      ),
                      const m3.SizedBox(width: 4),
                      MouseRegion(
                        onEnter: (_) {
                          setState(() {
                            _isHoveringSignUp = true;
                          });
                        },
                        onExit: (_) {
                          setState(() {
                            _isHoveringSignUp = false;
                          });
                        },
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              FluentPageRoute(
                                builder: (context) => const SignUpScreen(),
                              ),
                            );
                          },
                          child: m3.Text(
                            "Sign Up",
                            style: m3.TextStyle(
                              color: _isHoveringSignUp
                                  ? const Color(0xFF95b1ae)
                                  : const Color(0xFF4a6361),
                              fontWeight: m3.FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
