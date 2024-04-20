import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app/core/constants.dart';
import 'package:movies_app/core/utils/colors_manager.dart';
import 'package:provider/provider.dart';

import '../../../core/firebase/helper/firestore_helper.dart';
import '../../../core/firebase/providers/auth_provider.dart';
import '../../../core/firebase/providers/firebase_auth_error_codes.dart';
import '../../../core/reusable_components/custom_text_from_field.dart';
import '../../../core/reusable_components/dialog_utils.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/routes_manager.dart';
import '../../../data/model/user_model/user_model.dart';
import '../register/register_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isObscured = true;
  GlobalKey<FormState> formKey = GlobalKey();

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
                    'Hi, Welcome Back!',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Text(
                    'Hello again, you’ve been missed!',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: Colors.white,
                        ),
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
                  //login button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: Theme.of(context).elevatedButtonTheme.style,
                      onPressed: () {
                        login();
                      },
                      child: Text(
                        'Login',
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
                        'Don\'t have an account?',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, RegisterScreen.routeName);
                        },
                        child: Text(
                          'Sign Up',
                          style: Theme.of(context).textTheme.labelSmall,
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

  Future<void> login() async {
    AuthProviders authProviders = Provider.of<AuthProviders>(
      context,
      listen: false,
    );

    if (formKey.currentState!.validate()) {
      DialogUtils.showLoadingDialog(context);
      try {
        final credential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        DialogUtils.hideDialog(context);

        //user id is stored in credential.user.uid
        print(credential.user?.uid);
        UserModel? userModel =
            await FireStoreHelper.getUser(credential.user!.uid);
        authProviders.setUsers(credential.user, userModel);

        DialogUtils.showMessage(
            context: context,
            message: 'Login Successfully',
            positiveText: 'ok',
            positivePress: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                RoutesManager.homeScreenRoute,
                (route) => false,
              );
             // DialogUtils.hideDialog(context);
            });
      } on FirebaseAuthException catch (e) {
        DialogUtils.hideDialog(context);
        if (e.code == FirebaseAuthErrorCodes.userNotFound) {
          DialogUtils.showMessage(
              context: context,
              message: 'User Not Found',
              positiveText: 'ok',
              positivePress: () {
                Navigator.pop(context);
              });
        } else if (e.code == FirebaseAuthErrorCodes.wrongPassword) {
          DialogUtils.showMessage(
              context: context,
              message: 'Wrong Password',
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
