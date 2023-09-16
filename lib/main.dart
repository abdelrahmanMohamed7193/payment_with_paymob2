import 'package:flutter/material.dart';

import 'package:payment_paymob/Modules/register/register.dart';
import 'package:payment_paymob/network/DioHelper.dart';

void main() async{
  await DioHelperPayment.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
debugShowCheckedModeBanner: false,
      home:RegisterScreen() ,
    );
  }
}

