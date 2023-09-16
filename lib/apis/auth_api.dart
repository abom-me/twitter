

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as model;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:twitter/core/core.dart';

import '../core/type_defs.dart';
final authAPIProvider=Provider((ref)  {
  // return AuthAPI(account: Account(Client(end)));
});
abstract class IAuthAPI{
  FutureEither<model.User> signUP({
    required String email,
    required String password,
});
}


class AuthAPI implements IAuthAPI{
  final Account _account;

  AuthAPI({required Account account}) : _account = account;
  @override
  FutureEither<model.User> signUP({required String email, required String password}) async{
 try{
  final account = await  _account.create(userId: ID.unique(), email: email, password: password);

  return right(account);
 }on AppwriteException  catch(e,stackTrace){
   return left(Failure(message: e.message??"null", stackTrace: stackTrace));

 }

 catch(e,stackTrace){

   return left(Failure(message: e.toString(), stackTrace: stackTrace));
 }

  }

}