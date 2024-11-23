import 'package:flutter/material.dart' as m3;

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fluent_ui/fluent_ui.dart';

import 'package:admin/src/features/admin_authentication/admin_authentication.dart';

//TODO: No connection to appwrite
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpForm();
}

class _SignUpForm extends State<SignUpScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final _emailController = m3.TextEditingController();
  final _passwordController = m3.TextEditingController();
  final _confirmPasswordController = m3.TextEditingController();
  final _firstNameController = m3.TextEditingController();
  final _lastNameController = m3.TextEditingController();
  final _phoneNumberController = m3.TextEditingController();
  final _workAddressController = m3.TextEditingController();
  final _roleController = m3.TextEditingController();

  bool _isPasswordVisible = false;
  // final bool _isPasswordFocused = false;
  bool _isHoveringSignIn = false;

  bool _isPasswordValid(String password) {
    final hasMinLength = password.length >= 10;
    final hasMaxLength = password.length <= 60;
    final hasLetter = RegExp(r'[a-zA-Z]').hasMatch(password);
    final hasNumber = RegExp(r'\d').hasMatch(password);
    final hasSpecialCharacter = RegExp(r'[!@#$%^&*]').hasMatch(password);

    return hasMinLength &&
        hasMaxLength &&
        hasLetter &&
        hasNumber &&
        hasSpecialCharacter;
  }

  m3.InputDecoration _inputBoxDecoration(String labelText) {
    return m3.InputDecoration(
      isDense: true,
      labelText: labelText,
      labelStyle: const m3.TextStyle(
        color: Color(0xFF334B49),
        fontFamily: 'Roboto', // Custom font family
        fontSize: 15, // Font size
        fontWeight: m3.FontWeight.w400,
      ),
      errorStyle: const m3.TextStyle(
        fontSize: 10,
        color: m3.Colors.red,
        height:
            0.7, // Adjusts the space for error text without expanding input height
      ),
      contentPadding:
          const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
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
      errorBorder: m3.OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: const m3.BorderSide(
          color: m3.Colors.red,
          width: 1.0,
        ),
      ),
      focusedErrorBorder: m3.OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: const m3.BorderSide(
          color: m3.Colors.red,
          width: 1.0,
        ),
      ),
    );
  }

  Widget _buildPasswordRequirement(String text, bool isValid) {
    return Row(
      children: [
        Icon(
          isValid ? EvaIcons.checkmarkCircle2 : EvaIcons.closeCircle,
          color: isValid ? Colors.green : Colors.red,
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            color: isValid ? Colors.green : Colors.red,
          ),
        ),
      ],
    );
  }

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
                  const SizedBox(height: 15),
                  m3.SizedBox(
                    height: 40,
                    child: m3.Material(
                      child: m3.TextFormField(
                        controller: _emailController,
                        decoration: _inputBoxDecoration("Email Address"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '*enter your email address';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  const m3.SizedBox(height: 15),
                  m3.SizedBox(
                    height: 40,
                    child: m3.Material(
                      child: m3.TextFormField(
                        controller: _passwordController,
                        obscureText: !_isPasswordVisible,
                        decoration: _inputBoxDecoration("Password").copyWith(
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
                        onChanged: (value) {
                          setState(() {});
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '*enter your password';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  _buildPasswordRequirement(
                    'At least 10 characters, but no more than 60 characters',
                    _passwordController.text.length >= 10 &&
                        _passwordController.text.length <= 60,
                  ),
                  _buildPasswordRequirement(
                    'At least 1 letter',
                    RegExp(r'[a-zA-Z]').hasMatch(_passwordController.text),
                  ),
                  _buildPasswordRequirement(
                    'At least 1 number',
                    RegExp(r'\d').hasMatch(_passwordController.text),
                  ),
                  _buildPasswordRequirement(
                    'At least 1 special character, e.g. !,@,#,\$,%,^,&,*,',
                    RegExp(r'[!@#$%^&*]').hasMatch(_passwordController.text),
                  ),
                  const m3.SizedBox(height: 20),
                  m3.SizedBox(
                    height: 40,
                    child: m3.Material(
                      child: m3.TextFormField(
                        controller: _confirmPasswordController,
                        obscureText: !_isPasswordVisible,
                        decoration:
                            _inputBoxDecoration("Confirm Password").copyWith(
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
                        onChanged: (value) {
                          setState(() {});
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          }
                          if (value != _passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: m3.SizedBox(
                          height: 40,
                          child: m3.Material(
                            child: m3.TextFormField(
                              controller: _firstNameController,
                              decoration: _inputBoxDecoration("First Name"),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your first name';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ),
                      const m3.SizedBox(width: 15),
                      Expanded(
                        child: m3.SizedBox(
                          height: 40,
                          child: m3.Material(
                            child: m3.TextFormField(
                              controller: _lastNameController,
                              decoration: _inputBoxDecoration("Last Name"),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your last name';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const m3.SizedBox(height: 15),
                  m3.SizedBox(
                    height: 40,
                    child: m3.Material(
                      child: m3.TextFormField(
                        controller: _phoneNumberController,
                        decoration: _inputBoxDecoration("Phone Number"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  const m3.SizedBox(height: 15),
                  m3.SizedBox(
                    height: 40,
                    child: m3.Material(
                      child: m3.TextFormField(
                        controller: _workAddressController,
                        decoration: _inputBoxDecoration("Work Address"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your work address';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  const m3.SizedBox(height: 15),
                  m3.SizedBox(
                    height: 40,
                    child: m3.Material(
                      child: m3.TextFormField(
                        controller: _roleController,
                        decoration: _inputBoxDecoration("Role"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your role';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Button(
                    child: const Text('Sign Up'),
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {}
                    },
                  ),
                  m3.SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const m3.Text(
                        "Already have an account?",
                        style: m3.TextStyle(
                          color: m3.Colors.blueGrey,
                        ),
                      ),
                      const m3.SizedBox(width: 4),
                      MouseRegion(
                        onEnter: (_) {
                          setState(() {
                            _isHoveringSignIn = true;
                          });
                        },
                        onExit: (_) {
                          setState(() {
                            _isHoveringSignIn = false;
                          });
                        },
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              FluentPageRoute(
                                builder: (context) => const SignInScreen(),
                              ),
                            );
                          },
                          child: m3.Text(
                            "Sign In",
                            style: m3.TextStyle(
                              color: _isHoveringSignIn
                                  ? Color(0xFF95b1ae)
                                  : Color(0xFF4a6361),
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
