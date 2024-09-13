import 'package:admin/src/features/authentication/authentication.dart';
import 'package:admin/src/features/authentication/presentation/widgets/logo.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fluent_ui/fluent_ui.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  
  @override
  State <SignInScreen> createState() => _SignInForm();
}

class _SignInForm extends State <SignInScreen> {
  final GlobalKey <FormState> _formkey =GlobalKey<FormState>();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  bool _isEmailFocused = false;
  bool _isPasswordFocused = false;
  bool _isPasswordVisible = false;

  
  @override
  void initState() {
    super.initState();
    _emailFocusNode.addListener(() {
      setState(() {
        _isEmailFocused = _emailFocusNode.hasFocus;
        }
      );
    }
  );
    _passwordFocusNode.addListener(() {
    setState(() {
      _isPasswordFocused = _passwordFocusNode.hasFocus;
      }
    );
  }
);
}

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context){
    return ScaffoldPage(
      content: Center(
        child: Form(
          key: _formkey,
          child: Container(
            width:440,
            padding: const EdgeInsets.all(30.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: Offset(0,5),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const LogoWidget(height: 32),
                  const SizedBox(height: 16),
                  Visibility(
                    visible:_isEmailFocused,
                    child: const Text('Email')),
                     TextFormBox(
                      focusNode:_emailFocusNode,
                      padding: const EdgeInsets.all(5.0),
                      placeholder: _isEmailFocused? '':'Enter your email',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                          }
                          return null;
                          },
                          ),
                          const SizedBox (height: 16),
                          Visibility(
                            visible: _isPasswordFocused,
                            child: const Text('Password')),
                            TextFormBox(
                              focusNode: _passwordFocusNode,
                              padding: const EdgeInsets.all(5.0),
                              placeholder: _isPasswordFocused? '': 'Enter your password',
                              obscureText: !_isPasswordVisible,
                              suffix:IconButton(icon: Icon(_isPasswordVisible ? EvaIcons.eyeOutline : EvaIcons.eyeOffOutline,), 
                              onPressed:(){
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                  }
                                  return null;
                                  },
                                  ),
                                  const SizedBox(height: 16),
                                  Button(
                                    child: const Text ('Sign In'),
                                    onPressed: (){
                                      if (_formkey.currentState!.validate()){

                                      }
                                    },
                                  ),
                                ],
                              ),
                           ), 
                          ),
                        ),
                      );
                    }
                  }