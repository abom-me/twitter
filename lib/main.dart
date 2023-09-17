import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter/features/auth/controller/auth_controller.dart';
import 'package:twitter/features/auth/view/login_view.dart';
import 'package:twitter/features/home/widget/home_view.dart';
import 'package:twitter/theme/app_theme.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.theme,
      home: ref.watch(currentUserAccountProvider).when(data: (user){
        print(user?.email);
        return const HomeView();
      }, error: (e,w){
        print(e);
        // return const LoginView();
      },
          loading: ()=>Scaffold(body: CircularProgressIndicator(),))
    );
  }
}
