import 'package:bite_bringers/utils/colors.dart';
import 'package:bite_bringers/utils/dimensions.dart';
import 'package:bite_bringers/widgets/app_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: Dimensions.height20 * 3,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.arrow_back_ios,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                ),
                SizedBox(width: Dimensions.width20 * 5),
                AppIcon(
                  icon: Icons.home_outlined,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                ),
                AppIcon(
                  icon: Icons.shopping_cart_outlined,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                ),
              ],
            ),
          ),
          Positioned(
            top: Dimensions.height20 * 5,
            left: Dimensions.width20,
            right: Dimensions.width20,
            bottom: 0,
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.height15),
              color: Colors.red,
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (_, index) {
                    return Container(
                      margin: EdgeInsets.only(top: Dimensions.height10),
                     width: double.maxFinite,
                      height: Dimensions.height20*5,
                      child: Row(
                        children: [
                          Container(
                            width: Dimensions.width20*5,
                            height: Dimensions.height20*5,
                            margin: EdgeInsets.only(bottom: Dimensions.height10),
                            decoration: BoxDecoration(
                              image: DecorationImage(fit: BoxFit.cover,
                                image: AssetImage("assets/image/icecream_2.jpg"),),
                              borderRadius: BorderRadius.circular(Dimensions.radius20),
                              color: Colors.white,

                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
