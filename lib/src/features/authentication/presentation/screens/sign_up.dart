import 'package:admin/src/features/authentication/authentication.dart';
import 'package:admin/src/features/authentication/presentation/widgets/logo.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fluent_ui/fluent_ui.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  
  @override
  State <SignUpScreen> createState() => _SignUpForm();
}

class _SignUpForm extends State <SignUpScreen> {
  final GlobalKey <FormState> _formkey =GlobalKey<FormState>();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();
  final FocusNode _fullNameFocusNode = FocusNode();
  final FocusNode _phoneNumberFocusNode = FocusNode();
  final FocusNode _workAddressFocusNode = FocusNode();
  final FocusNode _roleFocusNode = FocusNode();
  bool _isEmailFocused = false;
  bool _isPasswordFocused = false;
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordFocused = false;
  bool _isConfirmPasswordVisible = false;
  bool _isFullNameFocused = false;
  bool _isPhoneNumberFocused = false;
  bool _isWorkAddressFocused = false;
  bool _isRoleFocused = false;
  String _password = '';
  final TextEditingController _phoneNumberController = TextEditingController();

  
  @override
  void initState() {
    super.initState();
    _emailFocusNode.addListener(() {
      setState(() {
        _isEmailFocused = _emailFocusNode.hasFocus;
        });
    });
    _passwordFocusNode.addListener(() {
    setState(() {
      _isPasswordFocused = _passwordFocusNode.hasFocus;
      });
  });
    _confirmPasswordFocusNode.addListener(() {
          setState(() {
            _isConfirmPasswordFocused = _confirmPasswordFocusNode.hasFocus;
            });
        });
     _fullNameFocusNode.addListener(() {
          setState(() {
            _isFullNameFocused = _fullNameFocusNode.hasFocus;
            });
        });
    _phoneNumberFocusNode.addListener(() {
          setState(() {
           _isPhoneNumberFocused = _phoneNumberFocusNode.hasFocus;
            });
        });
    _workAddressFocusNode.addListener(() {
          setState(() {
           _isWorkAddressFocused = _workAddressFocusNode.hasFocus;
            });
        });
   _roleFocusNode.addListener(() {
          setState(() {
           _isRoleFocused = _roleFocusNode.hasFocus;
            });
        });
}

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    _fullNameFocusNode.dispose();
    _phoneNumberFocusNode.dispose();
    _workAddressFocusNode.dispose();
    _roleFocusNode.dispose();
    super.dispose();
  }

  bool _isPasswordValid(String password) {
  final hasMinLength = password.length >= 10;
  final hasMaxLength = password.length <= 60;
  final hasLetter = RegExp(r'[a-zA-Z]').hasMatch(password);
  final hasNumber = RegExp(r'\d').hasMatch(password);
  final hasSpecialCharacter = RegExp(r'[!@#$%^&*]').hasMatch(password);

  return hasMinLength && hasMaxLength && hasLetter && hasNumber && hasSpecialCharacter;
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
                   onChanged: (value){
                    setState(() {
                      _password = value;
                    });
                   },
                   validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                        }
                        if (!_isPasswordValid(value)){
                          return 'Password does not meet the requirements';
                        }
                        return null;
                        },
                        ),
                const SizedBox(height:8),
                if(_isPasswordFocused)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        _buildPasswordRequirement(
                        'At least 10 characters but no more than 60 characters',
                        _password.length >= 10 && _password.length <= 60,
                      ),
                      _buildPasswordRequirement(
                        'At least one letter',
                        RegExp(r'[a-zA-Z]').hasMatch(_password),
                      ),
                      _buildPasswordRequirement(
                        'At least one number',
                        RegExp(r'\d').hasMatch(_password),
                      ),
                      _buildPasswordRequirement(
                        'At least one special character (!,@,#,\$,%,^,&,*)',
                        RegExp(r'[!@#$%^&*]').hasMatch(_password),
                      ),
                    ],),
                const SizedBox (height: 16),
                Visibility(
                  visible: _isConfirmPasswordFocused,
                  child: const Text('Confirm Password')),
                  TextFormBox(
                   focusNode: _confirmPasswordFocusNode,
                   padding: const EdgeInsets.all(5.0),
                   placeholder: _isConfirmPasswordFocused? '': 'Enter your confirm password',
                   obscureText: !_isConfirmPasswordVisible,
                   suffix:IconButton(icon: Icon(_isConfirmPasswordVisible ? EvaIcons.eyeOutline : EvaIcons.eyeOffOutline,), 
                              onPressed:(){
                                setState(() {
                                  _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                                });
                              },),
                   validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your confirm password';
                        }
                        if (value !=_password) {
                          return 'Passwords do not match';
                        }
                        return null;
                        },
                        ),
                const SizedBox (height: 16),
                Visibility(
                  visible: _isFullNameFocused,
                  child: const Text('Full Name')),
                  TextFormBox(
                   focusNode: _fullNameFocusNode,
                   padding: const EdgeInsets.all(5.0),
                   placeholder: _isFullNameFocused? '': 'First Name, Middle Name, Last Name',
                   validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your full name';
                        }
                        return null;
                        },
                        ),
                const SizedBox (height: 16),
                Visibility(
                  visible: _isPhoneNumberFocused,
                  child: const Text('Phone Number')),
                  TextFormBox(
                   focusNode: _phoneNumberFocusNode,
                   controller: _phoneNumberController,
                   padding: const EdgeInsets.all(5.0),
                   placeholder: _isPhoneNumberFocused ? '' : 'Phone Number',
                   prefix: _isPhoneNumberFocused ? const Text (' 63|') : null, 
                   validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                        }
                        return null;
                        },
                        ),
                const SizedBox (height: 16),
                Visibility(
                  visible: _isWorkAddressFocused,
                  child: const Text('Work Address')),
                  TextFormBox(
                   focusNode: _workAddressFocusNode,
                   padding: const EdgeInsets.all(5.0),
                   placeholder: _isWorkAddressFocused? '': 'Enter your Work Address',
                   validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Work Address';
                        }
                        return null;
                        },
                        ),
                const SizedBox (height: 16),
                Visibility(
                  visible: _isRoleFocused,
                  child: const Text('Role')),
                  TextFormBox(
                   focusNode: _roleFocusNode,
                   padding: const EdgeInsets.all(5.0),
                   placeholder: _isRoleFocused? '': 'Enter your Role',
                   validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Role';
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
        

        Widget _buildPasswordRequirement(String text, bool isValid){
          return Row(
            children: [
              Icon(
                isValid ? EvaIcons.checkmarkCircle2 : EvaIcons. closeCircle,
                color: isValid ? Colors.green : Colors.red,
              ),
              const SizedBox(width: 8),
              Text(
                text,
                style: TextStyle(
                  color: isValid? Colors.green : Colors.red,
                ),
                ),
            ],
          );
        }
}