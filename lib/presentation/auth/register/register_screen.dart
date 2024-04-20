import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app/core/constants.dart';
import 'package:provider/provider.dart';

import '../../../config/theme/app_theme.dart';
import '../../../core/firebase/helper/firestore_helper.dart';
import '../../../core/firebase/providers/auth_provider.dart';
import '../../../core/firebase/providers/firebase_auth_error_codes.dart';
import '../../../core/reusable_components/custom_text_from_field.dart';
import '../../../core/reusable_components/dialog_utils.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/colors_manager.dart';
import '../../../core/utils/routes_manager.dart';
import '../../../data/model/user_model/user_model.dart';
import '../login/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = '/register';

  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  TextEditingController fullNameController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  bool isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Lottie.asset(
                      height: 200.h,
                      AssetsManager.appLogo,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Create an account',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Text(
                    'Watch Your Favourite Movies',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Full Name',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: ColorsManager.selectedTabColor,
                    ),
                  ),
                  CustomTextFormField(
                    keyboardType: TextInputType.name,
                    controller: fullNameController,
                    hintText: 'Enter your name',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your full name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Email',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: ColorsManager.selectedTabColor,
                    ),
                  ),
                  CustomTextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    hintText: 'Enter your email',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email can\t be empty';
                      }
                      if (!RegExp(Constants.emailRegex).hasMatch(value)) {
                        return ('Email is not valid');
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Password',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: ColorsManager.selectedTabColor,
                    ),
                  ),
                  CustomTextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    controller: passwordController,
                    hintText: 'Enter your password',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "This field can't be empty";
                      }
                      if (value.length < 8) {
                        return "Password should be at least 8 char";
                      }
                      return null;
                    },
                    obscureText: isObscured,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isObscured = !isObscured;
                        });
                      },
                      icon: isObscured
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                      style: Theme.of(context).iconButtonTheme.style,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Confirm Password',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: ColorsManager.selectedTabColor,
                    ),
                  ),
                  CustomTextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    controller: confirmPasswordController,
                    hintText: 'Confirm your password',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "This field can't be empty";
                      }
                      if (value.length < 8) {
                        return "Password should be at least 8 char";
                      }
                      if (value != passwordController.text) {
                        return "Password doesn't match";
                      }
                      return null;
                    },
                    obscureText: isObscured,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isObscured = !isObscured;
                        });
                      },
                      icon: isObscured
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                      style: Theme.of(context).iconButtonTheme.style,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: Theme.of(context).elevatedButtonTheme.style,
                      onPressed: () {
                        registerUser();
                      },
                      child: Text(
                        'Sign Up',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: AppTheme.lightTheme.textTheme.labelSmall,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(RoutesManager.loginRouteName);
                        },
                        child: Text('Sign In',
                            style: AppTheme.lightTheme.textTheme.labelSmall),
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

  Future<void> registerUser() async {
    /*AuthProviders authProviders = Provider.of<AuthProviders>(
      context,
      listen: false,
    );*/
    if (formKey.currentState!.validate()) {
      DialogUtils.showLoadingDialog(context);
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        DialogUtils.hideDialog(context);

        await FireStoreHelper.addUser(
          emailController.text,
          fullNameController.text,
          credential.user!.uid,
        );

        //DialogUtils.hideDialog(context);

        //User ID is generated by firebase
        print(credential.user!.uid);

        //todo: ask why doesn't navigate to home screen??
        DialogUtils.showMessage(
            context: context,
            message: 'Register Successfully',
            positiveText: 'ok',
            positivePress: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                RoutesManager.homeScreenRoute,
                    (route) => false,
              );
            });
      } on FirebaseAuthException catch (e) {
        DialogUtils.hideDialog(context);
        if (e.code == FirebaseAuthErrorCodes.weakPassword) {
          DialogUtils.showMessage(
            context: context,
            message: 'Weak Password',
            positiveText: 'ok',
            positivePress: () {
              Navigator.pop(context);
            },
          );
        } else if (e.code == FirebaseAuthErrorCodes.emailAlreadyInUse) {
          DialogUtils.showMessage(
              context: context,
              message: 'Email Already In Use',
              positiveText: 'ok',
              positivePress: () {
                Navigator.pop(context);
              });
        }
      } catch (e) {
        DialogUtils.showMessage(
            context: context,
            message: e.toString(),
            positiveText: 'ok',
            positivePress: () {
              Navigator.pop(context);
            });
      }
    }
  }
}
