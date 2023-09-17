
import 'package:appwrite/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter/core/utils.dart';
import 'package:twitter/features/auth/view/login_view.dart';
import 'package:twitter/features/home/widget/home_view.dart';

import '../../../apis/auth_api.dart';

final authControllerProvider = StateNotifierProvider<AuthController, bool>((ref) {
  return AuthController(authAPI: ref.watch(authAPIProvider));
});


final currentUserAccountProvider = FutureProvider((ref)  {
  final authController=ref.watch(authControllerProvider.notifier);
  return authController.currentUser() ;
});

class AuthController extends StateNotifier<bool>{
  final AuthAPI _authAPI;
  AuthController({required AuthAPI authAPI}):_authAPI=authAPI,super(false);
 Future<User?> currentUser()=>_authAPI.currentUserAccount();

  Future<void> signUp({
    required String email,
    required String password,
    required BuildContext context,
}) async {
    state=true;
    final res=await _authAPI.signUP(email: email, password: password);
    state=false;
    res.fold((l) {
      print(l.message);
      showSnackBar(context, l.message);}, (r)  {
      showSnackBar(context, 'The Account has been created!!');
      Navigator.push(context, LoginView.route());
    });
  }


  Future<void> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    state=true;
    final res=await _authAPI.login(email: email, password: password);
    state=false;
    res.fold((l) => showSnackBar(context, l.message), (r) {

      Navigator.push(context, HomeView.route());
    });
  }

}