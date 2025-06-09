import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:try_apps/providers/randomuserprovider.dart';
import 'package:try_apps/providers/registerprovider.dart';
import 'package:try_apps/providers/weatherprovider.dart';
import 'package:try_apps/screens/loginscreen.dart';
import 'package:try_apps/screens/randomuserscreen.dart';
import 'package:try_apps/screens/signupscreen.dart';
import 'package:try_apps/screens/weatherscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => RegisterProvider()),
      ChangeNotifierProvider(create: (context) => RandomUserProvider())
    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ),
    );
  }
}