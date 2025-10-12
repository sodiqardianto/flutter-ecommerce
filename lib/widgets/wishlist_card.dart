import 'package:ecommerce_chat/theme.dart';
import 'package:flutter/material.dart';

class WishlistCard extends StatelessWidget {
  const WishlistCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(top: 10, left: 12, bottom: 14, right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: backgroundColor4,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset('assets/image_shoes.png', width: 60),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'TERREX URBAN LOW',
                  style: primaryTextStyle.copyWith(fontWeight: semiBold),
                ),
                Text('\$52.75', style: priceTextStyle),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Image.asset('assets/button_wishlist_blue.png', width: 34),
          ),
        ],
      ),
    );
  }
}
