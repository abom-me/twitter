
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter/core/utils.dart';

import '../../../apis/auth_api.dart';

final authControllerProvider = StateNotifierProvider<AuthController, bool>((ref) {
  return AuthController(authAPI: ref.watch(authAPIProvider));
});

class AuthController extends StateNotifier<bool>{
  final AuthAPI _authAPI;
  AuthController({required AuthAPI authAPI}):_authAPI=authAPI,super(false);
  Future<void> signUp({
    required String email,
    required String password,
    required BuildContext context,
}) async {
    state=true;
    final res=await _authAPI.signUP(email: email, password: password);
    state=false;
    res.fold((l) => showSnackBar(context, l.message), (r) => print(r.email));
  }


  Future<void> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    state=true;
    final res=await _authAPI.login(email: email, password: password);
    state=false;
    res.fold((l) => showSnackBar(context, l.message), (r) => print(r.userId));
  }

}