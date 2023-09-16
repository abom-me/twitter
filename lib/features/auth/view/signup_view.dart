import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter/features/auth/controller/auth_controller.dart';

import '../../../common/rounded_button.dart';
import '../../../constans/ui_constants.dart';
import '../../../theme/pallete.dart';
import '../widgets/auth_field.dart';

class SignupView extends ConsumerStatefulWidget {
  const SignupView({super.key});
  static route()=>MaterialPageRoute(builder: (context)=>const SignupView());

  @override
  ConsumerState<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends ConsumerState<SignupView> {
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
void onSignUp(){

   ref.read(authControllerProvider.notifier).signUp(email: emailController.text, password: passwordController.text, context: context) ;
}
  @override
  Widget build(BuildContext context) {
    final isLoading=ref.watch(authControllerProvider);
    return Scaffold(
      appBar: appbar,
      body: Center(
        child:isLoading?const CircularProgressIndicator(): SingleChildScrollView(
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
                  child: RoundedSmallButton(onTap: onSignUp, backgroundColor: Pallete.whiteColor,textColor: Pallete.backgroundColor,
                      child: "Login"),
                ),
                const SizedBox(
                  height: 40,
                ),
                RichText(text: TextSpan(text: "Dont't have an account?",
                  children:  const [
                    TextSpan(text: " LogIn",style: TextStyle(fontSize: 16,color: Pallete.blueColor))
                  ],style: const TextStyle(fontSize: 16,color: Pallete.whiteColor),
                  recognizer: TapGestureRecognizer()..onTap=(){

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
