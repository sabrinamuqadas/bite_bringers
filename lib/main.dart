import 'package:bite_bringers/Controllers/cart_controller.dart';
import 'package:bite_bringers/Controllers/popular_product_controller.dart';
import 'package:bite_bringers/Controllers/recommended_product_controller.dart';
import 'package:bite_bringers/pages/auth/sign_up_page.dart';
import 'package:bite_bringers/pages/cart/cart_page.dart';
import 'package:bite_bringers/pages/food/popular_food_detail.dart';
import 'package:bite_bringers/pages/food/recommended_food_detail.dart';
import 'package:bite_bringers/pages/home/food_page_body.dart';
import 'package:bite_bringers/pages/home/main_food_page.dart';
import 'package:bite_bringers/pages/splash/splash_page.dart';
import 'package:bite_bringers/routes/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   Get.find<CartController>().getCartData();
  return GetBuilder<PopularProductController>(builder: (_){
    return GetBuilder<RecommendedProductController>(builder: (_){
      return const GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: SignUpPage(),
        //home: SplashScreen(),
        //initialRoute: RouteHelper.getSplashPage(),
        //getPages: RouteHelper.routes,
      );
    });
  });
  }
}
