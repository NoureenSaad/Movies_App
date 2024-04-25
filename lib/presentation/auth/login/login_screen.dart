import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app/core/constants.dart';
import 'package:movies_app/core/firebase/providers/auth_provider.dart';
import 'package:movies_app/core/utils/colors_manager.dart';
import 'package:movies_app/core/utils/routes_manager.dart';
import 'package:movies_app/data/model/user_model/user_model.dart';
import 'package:movies_app/presentation/auth/login/viewmodel/login_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../../core/DI/di.dart';

import '../../../core/firebase/helper/firestore_helper.dart';
import '../../../core/reusable_components/custom_text_from_field.dart';

import '../../../core/utils/assets_manager.dart';

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
    AuthProviders provider = Provider.of<AuthProviders>(context);
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => getIt<loginViewModel>(),
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
                      child: BlocConsumer<loginViewModel, loginState>(
                        listener: (context, state) {
                          if (state is loginSuccessState) {
                            Fluttertoast.showToast(
                                msg: "Login Successfully",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                fontSize: 16.0);
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                RoutesManager.homeScreenRoute,
                                (route) => false);
                          }
                          if (state is loginErrorState) {
                            Fluttertoast.showToast(
                                msg: state.errorMessage.toString(),
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          }
                        },
                        builder: (BuildContext context, loginState state) {
                          if (state is loginLoadingState) {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            );
                          }
                          return ElevatedButton(
                            style: Theme.of(context).elevatedButtonTheme.style,
                            onPressed: () async {
                              if (formKey.currentState?.validate() ?? false) {
                                loginViewModel login =
                                    loginViewModel.get(context);
                                login.login(emailController.text,
                                    passwordController.text, context);
                                UserModel? user = await FireStoreHelper.getUser(
                                    FirebaseAuth.instance.currentUser!.uid);
                                provider.setUsers(
                                    FirebaseAuth.instance.currentUser!.uid
                                        as User?,
                                    user);
                              }
                            },
                            child: Text(
                              'Login',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(
                                    color: Colors.black,
                                  ),
                            ),
                          );
                        },
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
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w400
                          ),
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
      ),
    );
  }
}
