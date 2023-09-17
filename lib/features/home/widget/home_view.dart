

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../../../constans/ui_constants.dart';
class HomeView extends ConsumerWidget {
  static route()=>MaterialPageRoute(builder: (context)=>const HomeView());

   const HomeView({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appbar = UIConstants.appBar();
    return Scaffold(
appBar: appbar,
    );
  }
}
