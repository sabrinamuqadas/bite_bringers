import 'package:bite_bringers/Controllers/cart_controller.dart';
import 'package:bite_bringers/utils/app_constants.dart';
import 'package:bite_bringers/utils/colors.dart';
import 'package:bite_bringers/utils/dimensions.dart';
import 'package:bite_bringers/widgets/app_icon.dart';
import 'package:bite_bringers/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({super.key});

  @override
  Widget build(BuildContext context) {
    var getCartHistoryList = Get.find<CartController>().getCartHistoryList();

    Map<String, int> cartItemsPerOrder = Map();
    for (int i = 0; i <getCartHistoryList.length; i++) {
      if (cartItemsPerOrder.containsKey(getCartHistoryList[i].time)) {
        cartItemsPerOrder.update(
            getCartHistoryList[i].time!, (value) => ++value);
      } else {
        cartItemsPerOrder.putIfAbsent(getCartHistoryList[i].time!, () => 1);
      }
    }

    List<int> cartOrderTimeToList() {
      return cartItemsPerOrder.entries.map((e) => e.value).toList();
    }
    List<int> itemsPerOrder = cartOrderTimeToList(); //3,2,4

    var listCounter = 0;

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 100,
            color: AppColors.mainColor,
            width: double.maxFinite,
            padding: EdgeInsets.only(top: 45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BigText(text: "Cart History", color: Colors.white,),
                AppIcon(icon: Icons.shopping_cart_outlined,iconColor: Colors.white,
                backgroundColor: AppColors.yellowColor,)
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                top: Dimensions.height20,
                left: Dimensions.width20,
                right: Dimensions.width20,
              ),
              child: MediaQuery.removePadding(removeTop: true,
                context: context, child:  ListView(
                children: [
                  for(int i=0; i<itemsPerOrder.length; i++) //outer loop
                    Container(margin: EdgeInsets.only(bottom: Dimensions.height20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BigText(text: "09/03/2024"),
                          SizedBox(height: Dimensions.height10,),
                          Row(
                            children: [
                              Wrap(
                                direction: Axis.horizontal,
                                //inner loop
                                children: List.generate(itemsPerOrder[i], (index) {
                                  if(listCounter<getCartHistoryList.length){
                                    listCounter++;
                                  }
                                  return Container(
                                    height: 80,
                                    width: 80,
                                    margin: EdgeInsets.only(right: Dimensions.width10/2),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(Dimensions.radius15/2),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(AppConstants.BASE_URL+AppConstants.UPLOAD_URL+getCartHistoryList[listCounter-1].image!),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                ],
              ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
