import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter/common/rounded_button.dart';
import 'package:twitter/constans/ui_constants.dart';
import 'package:twitter/features/auth/controller/auth_controller.dart';
import 'package:twitter/features/auth/view/signup_view.dart';
import 'package:twitter/features/auth/widgets/auth_field.dart';
import 'package:twitter/theme/pallete.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});
static route()=>MaterialPageRoute(builder: (context)=>const LoginView());
  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final appbar = UIConstants.appBar();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
void onLogin(){
    ref.watch(authControllerProvider.notifier).login(email: emailController.text, password: passwordController.text, context: context);
}
  @override
  Widget build(BuildContext context) {
    final isLoading=    ref.watch(authControllerProvider);
    return Scaffold(
      appBar: appbar,
      body: Center(
        child: isLoading?CircularProgressIndicator(): SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// --------{Email}---------------
                AuthField(
                  controller: emailController,
                  hintText: 'Email',
                ),
                const SizedBox(
                  height: 20,
                ),
                AuthField(
                  controller: passwordController,
                  hintText: 'Password',
                ),
                /// --------{Login BTN}---------------
                const SizedBox(
                  height: 40,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: RoundedSmallButton(onTap: onLogin, backgroundColor: Pallete.whiteColor,textColor: Pallete.backgroundColor,
                  child: "Login"),
                ),
                const SizedBox(
                  height: 40,
                ),
                RichText(text: TextSpan(text: "Dont't have an account?",
                children: [
                    TextSpan(text: " SignUp",style: TextStyle(fontSize: 16,color: Pallete.blueColor))
                ],style: TextStyle(fontSize: 16,color: Pallete.whiteColor),
                recognizer: TapGestureRecognizer()..onTap=(){
Navigator.push(context, SignupView.route());
                },
                ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
