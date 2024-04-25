import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app/core/constants.dart';
import 'package:movies_app/core/firebase/helper/firestore_helper.dart';
import 'package:movies_app/presentation/auth/register/viewmodel/register_viewmodel.dart';

import '../../../config/theme/app_theme.dart';
import '../../../core/DI/di.dart';

import '../../../core/reusable_components/custom_text_from_field.dart';

import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/colors_manager.dart';
import '../../../core/utils/routes_manager.dart';

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
  bool isConfirmObscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => getIt<RegisterViewModel>(),
        child: SafeArea(
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
                      obscureText: isConfirmObscured,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isConfirmObscured = !isConfirmObscured;
                          });
                        },
                        icon: isConfirmObscured
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
                      child: BlocConsumer<RegisterViewModel, RegisterState>(
                          listener: (context, state) {
                        if (state is RegisterSuccessState) {
                          Fluttertoast.showToast(
                              msg: "Register Successfully",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 16.0);
                          FireStoreHelper.addUser(
                            emailController.text,
                            fullNameController.text,
                            FirebaseAuth.instance.currentUser!.uid,
                          );
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              RoutesManager.homeScreenRoute, (route) => false);
                        }
                        if (state is RegisterErrorState) {
                          Fluttertoast.showToast(
                              msg: state.errorMessage.toString(),
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                      }, builder: (context, state) {
                        if (state is RegisterLoadingState) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          );
                        }
                        return ElevatedButton(
                          style: Theme.of(context).elevatedButtonTheme.style,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              RegisterViewModel register =
                                  RegisterViewModel.get(context);
                              register.register(
                                  emailController.text,
                                  passwordController.text,
                                  confirmPasswordController.text,
                                  fullNameController.text);
                            }
                          },
                          child: Text(
                            'Sign Up',
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(
                                  color: Colors.black,
                                ),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: AppTheme.lightTheme.textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.w400
                          ),
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
      ),
    );
  }
}
