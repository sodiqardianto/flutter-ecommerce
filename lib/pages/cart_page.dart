import 'package:flutter/material.dart';
import 'package:ecommerce_chat/theme.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  PreferredSizeWidget header() {
    return AppBar(
      backgroundColor: backgroundColor1,
      centerTitle: true,
      title: Text('Your Cart', style: primaryTextStyle),
      iconTheme: IconThemeData(color: primaryTextColor),
      elevation: 0,
    );
  }

  Widget emptyCart(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/icon_empty_cart.png', width: 80),
          SizedBox(height: 20),
          Text(
            'Oops! Your cart is empty',
            style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          ),
          SizedBox(height: 12),
          Text('Lets find your favorite shoes', style: secondaryTextStyle),
          SizedBox(height: 20),
          SizedBox(
            width: 152,
            height: 44,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/home',
                  (route) => false,
                );
              },
              child: Text(
                'Explore Store',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: header(),
      body: emptyCart(context),
    );
  }
}
