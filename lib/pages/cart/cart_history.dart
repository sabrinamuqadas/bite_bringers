import 'dart:convert';

import 'package:bite_bringers/Controllers/cart_controller.dart';
import 'package:bite_bringers/base/no_data_page.dart';
import 'package:bite_bringers/models/cart_model.dart';
import 'package:bite_bringers/routes/route_helper.dart';
import 'package:bite_bringers/utils/app_constants.dart';
import 'package:bite_bringers/utils/colors.dart';
import 'package:bite_bringers/utils/dimensions.dart';
import 'package:bite_bringers/widgets/app_icon.dart';
import 'package:bite_bringers/widgets/big_text.dart';
import 'package:bite_bringers/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({super.key});

  @override
  Widget build(BuildContext context) {
    var getCartHistoryList = Get.find<CartController>()
        .getCartHistoryList().reversed.toList();

    Map<String, int> cartItemsPerOrder = Map();
    for (int i = 0; i <getCartHistoryList.length; i++) {
      if (cartItemsPerOrder.containsKey(getCartHistoryList[i].time)) {
        cartItemsPerOrder.update(
            getCartHistoryList[i].time!, (value) => ++value);
      } else {
        cartItemsPerOrder.putIfAbsent(getCartHistoryList[i].time!, () => 1);
      }
    }

    List<int> cartItemsPerOrderToList() {
      return cartItemsPerOrder.entries.map((e) => e.value).toList();
    }
    List<String> cartOrderTimeToList() {
      return cartItemsPerOrder.entries.map((e) => e.key).toList();
    }
    List<int> itemsPerOrder = cartItemsPerOrderToList(); //3,2,4

    var listCounter = 0;
    Widget timeWidget(int index){
      var outputDate = DateTime.now().toString();
     if(index<getCartHistoryList.length){
       DateTime parseDate =  DateFormat("yyyy-MM-dd HH:mm:ss").parse(getCartHistoryList[listCounter].time!);
       var inputDate = DateTime.parse(parseDate.toString());
       var outputFormat = DateFormat("dd/MM/yyyy hh:mm a");
       outputDate = outputFormat.format(inputDate);
     }
      return BigText(text: outputDate);
    }

    return Scaffold(
      body: Column(
        children: [
          //header or app bar
          Container(
            height: Dimensions.height10*10,
            color: AppColors.mainColor,
            width: double.maxFinite,
            padding: EdgeInsets.only(top: Dimensions.height45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BigText(text: "Cart History", color: Colors.white,),
                AppIcon(icon: Icons.shopping_cart_outlined,iconColor: Colors.white,
                backgroundColor: AppColors.yellowColor,)
              ],
            ),
          ),
          //body
         GetBuilder<CartController>(builder: (_cartController){
           var cartLength = _cartController.getCartHistoryList();
           return cartLength.length>0?
           Expanded(
             child: Container(
               margin: EdgeInsets.only(
                 top: Dimensions.height20,
                 left: Dimensions.width20,
                 right: Dimensions.width20,
               ),
               child: MediaQuery.removePadding(removeTop: true,
                 context: context, child: ListView(
                   children: [
                     for(int i=0; i<itemsPerOrder.length; i++) //outer loop
                       Container(
                         height: Dimensions.height30*4,
                         margin: EdgeInsets.only(bottom: Dimensions.height20),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             timeWidget(listCounter),
                             SizedBox(height: Dimensions.height10,),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Wrap(
                                   direction: Axis.horizontal,
                                   //inner loop
                                   children: List.generate(itemsPerOrder[i], (index) {
                                     if(listCounter<getCartHistoryList.length){
                                       listCounter++;
                                     }
                                     return index<=2?Container(
                                       height: Dimensions.height20*4 ,
                                       width: Dimensions.width20*4,
                                       margin: EdgeInsets.only(right: Dimensions.width10/2),
                                       decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(Dimensions.radius15/2),
                                         image: DecorationImage(
                                           fit: BoxFit.cover,
                                           image: NetworkImage(AppConstants.BASE_URL+AppConstants.UPLOAD_URL+getCartHistoryList[listCounter-1].image!),
                                         ),
                                       ),
                                     ):Container();
                                   }),
                                 ),
                                 Container(
                                   height: Dimensions.height20*4,
                                   child: Column(
                                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                     crossAxisAlignment: CrossAxisAlignment.end,
                                     children: [
                                       SmallText(text: "Total", color: AppColors.titleColor,),
                                       BigText(text: itemsPerOrder[i].toString()+" Items",color: AppColors.titleColor,),
                                       GestureDetector(
                                         onTap: (){
                                           var orderTime = cartOrderTimeToList();
                                           //print("Order Time "+orderTime[i].toString());
                                           Map<int, CartModel> moreOrder = {};
                                           for(int j=0; j<getCartHistoryList.length; j++){
                                             if(getCartHistoryList[j].time== orderTime[i]){
                                               moreOrder.putIfAbsent(getCartHistoryList[j].id!, () =>
                                                   CartModel.fromJson(jsonDecode(jsonEncode(getCartHistoryList[j])))
                                               );
                                               //print("My order time is "+orderTime[i]);
                                               // print("The cart or product id is "+getCartHistoryList[j].id.toString());
                                               //print("Product info is "+jsonEncode(getCartHistoryList[j]));
                                             }
                                           }
                                           Get.find<CartController>().setItems = moreOrder;
                                           Get.find<CartController>().addToCartList();
                                           Get.toNamed(RouteHelper.getCartPage());
                                         },
                                         child: Container(
                                           padding: EdgeInsets.symmetric(horizontal: Dimensions.width10,
                                               vertical: Dimensions.height10/2),
                                           decoration: BoxDecoration(
                                             borderRadius: BorderRadius.circular(Dimensions.radius15/3),
                                             border: Border.all(width: 1, color: AppColors.mainColor,),
                                           ),
                                           child: SmallText(text: "one more", color: AppColors.mainColor,),
                                         ),
                                       ),
                                     ],
                                   ),
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
           ):
           SizedBox(
             height: MediaQuery.of(context).size.height/1.5,
               child: const Center(
                 child: NoDataPage(
                   text: "You did not buy anything so far !",
                   imgPath: "image/empty_box.png",),
               ));
         }),
        ],
      ),
    );
  }
}
