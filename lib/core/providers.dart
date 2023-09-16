


import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter/constans/appwrite_constans.dart';

final appwriteClintProvider=Provider((ref){
  return Client().setEndpoint(AppwriteConstans.endPoint).setProject(AppwriteConstans.projectID)
      .setSelfSigned(status: true);

});

final appwriteAccountProvider = Provider((ref) {
  final client=ref.watch(appwriteClintProvider);
  return Account(client);

});