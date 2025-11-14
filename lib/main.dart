import 'package:ecommerce_chat/pages/cart_page.dart';
import 'package:ecommerce_chat/pages/detail_chat_page.dart';
import 'package:ecommerce_chat/pages/home/edit_profile_page.dart';
import 'package:ecommerce_chat/pages/home/main_page.dart';
import 'package:ecommerce_chat/pages/product_page.dart';
import 'package:ecommerce_chat/pages/sign_in_page.dart';
import 'package:ecommerce_chat/pages/sign_up_page.dart';
import 'package:ecommerce_chat/pages/splash_page.dart';
import 'package:ecommerce_chat/providers/auth_provider.dart';
import 'package:ecommerce_chat/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (contex) => SplashPage(),
          '/sign-in': (contex) => SignInPage(),
          '/sign-up': (contex) => SignUpPage(),
          '/home': (context) => MainPage(),
          '/detail-chat': (context) => DetailChatPage(),
          '/edit-profile': (context) => EditProfilePage(),
          '/product': (context) => ProductPage(),
          '/cart': (context) => CartPage(),
        },
      ),
    );
  }
}
