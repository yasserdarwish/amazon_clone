import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:amazon_clone/common/widgets/custom_text_field.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/auth/services/auth_service.dart';
import 'package:flutter/material.dart';

enum Auth { signin, signup }

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  Auth _auth = Auth.signup;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  void signupUser() {
    authService.signupUser(
        context: context,
        name: _nameController.text,
        email: _emailController.text,
        password: _passwordController.text);
  }

  void signinUser() {
    authService.signinUser(
        context: context,
        email: _emailController.text,
        password: _passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              'Welcome',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            ListTile(
              tileColor: _auth == Auth.signup
                  ? GlobalVariables.backgroundColor
                  : GlobalVariables.greyBackgroundCOlor,
              leading: Radio(
                  value: Auth.signup,
                  groupValue: _auth,
                  onChanged: (value) {
                    setState(() {
                      _auth = value!;
                    });
                  }),
              title: const Text(
                'Create Account',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            _auth == Auth.signup
                ? Container(
                    color: GlobalVariables.backgroundColor,
                    padding: const EdgeInsets.all(8),
                    child: Form(
                        autovalidateMode: autovalidateMode,
                        key: _signUpFormKey,
                        child: Column(
                          children: [
                            CustomTextField(
                              digitsOnly: false,
                              controller: _nameController,
                              hint: 'Name',
                            ),
                            const SizedBox(height: 10),
                            CustomTextField(
                              digitsOnly: false,
                              controller: _emailController,
                              hint: 'Email',
                            ),
                            const SizedBox(height: 10),
                            CustomTextField(
                              digitsOnly: false,
                              controller: _passwordController,
                              hint: 'Password',
                            ),
                            const SizedBox(height: 10),
                            CustomButton(
                                text: 'Sign Up',
                                onPressed: () {
                                  if (_signUpFormKey.currentState!.validate()) {
                                    signupUser();
                                  } else {
                                    setState(() {
                                      autovalidateMode =
                                          AutovalidateMode.always;
                                    });
                                  }
                                })
                          ],
                        )),
                  )
                : const SizedBox(),
            ListTile(
              tileColor: _auth == Auth.signin
                  ? GlobalVariables.backgroundColor
                  : GlobalVariables.greyBackgroundCOlor,
              leading: Radio(
                  value: Auth.signin,
                  groupValue: _auth,
                  onChanged: (value) {
                    setState(() {
                      _auth = value!;
                    });
                  }),
              title: const Text(
                'Login',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            _auth == Auth.signin
                ? Container(
                    color: GlobalVariables.backgroundColor,
                    padding: const EdgeInsets.all(8),
                    child: Form(
                        autovalidateMode: autovalidateMode,
                        key: _signInFormKey,
                        child: Column(
                          children: [
                            CustomTextField(
                              digitsOnly: false,
                              controller: _emailController,
                              hint: 'Email',
                            ),
                            const SizedBox(height: 10),
                            CustomTextField(
                              digitsOnly: false,
                              controller: _passwordController,
                              hint: 'Password',
                            ),
                            const SizedBox(height: 10),
                            CustomButton(
                                text: 'Login',
                                onPressed: () {
                                  if (_signInFormKey.currentState!.validate()) {
                                    signinUser();
                                  } else {
                                    setState(() {
                                      autovalidateMode =
                                          AutovalidateMode.always;
                                    });
                                  }
                                })
                          ],
                        )),
                  )
                : const SizedBox(),
          ]),
        ),
      ),
    );
  }
}
