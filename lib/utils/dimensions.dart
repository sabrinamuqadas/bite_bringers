import 'package:get/get.dart';
// we use Getx package to get dimensions of any device for stateless class
// get package used for routing and state management

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  //we got x value (2.64) by dividing actual height of device over by_default size of parent container
  //that is 844/320
  static double pageView = screenHeight / 2.64;
  //that is 844/220
  static double pageViewContainer = screenHeight / 3.84;
  //844/120 = 7.03
  static double pageViewTextContainer = screenHeight / 7.03;

  //Dynamic height padding and margin
  static double height10 = screenHeight / 84.4;
  static double height15 = screenHeight / 56.27;
  static double height20 = screenHeight / 42.2;
  static double height30 = screenHeight / 28.13;
  static double height45 = screenHeight / 18.76;

  //Dynamic width padding and margin
  static double width10 = screenHeight / 84.4;
  static double width15 = screenHeight / 56.27;
  static double width20 = screenHeight / 42.2;
  static double width30 = screenHeight / 28.13;
  static double width45 = screenHeight / 18.76;

  //Font size
  static double font16 = screenHeight/52.75;
  static double font20 = screenHeight / 42.2;
  static double font26 = screenHeight / 32.46;

  //Radius
  static double radius15 = screenHeight / 56.27;
  static double radius20 = screenHeight / 42.2;
  static double radius30 = screenHeight / 28.13;

  //Icon Size
  static double iconSize24 = screenHeight / 35.17;
  static double iconSize16 = screenHeight / 52.75;
  //List view size
  //390/120
  static double listViewImgSize = screenWidth / 3.25;
  //390/100
  static double listViewTextcontSize = screenWidth / 3.9;
  //Popular food
  //844/350
  static double popularFoodimgSize = screenHeight / 2.41;
  //Bottom height
  //844/120
  static double bottomHeightBar = screenHeight / 7.03;
  //Splash screen dimensions
  static double splashImg250 = screenHeight/ 3.38;
  static double splashImg260 = screenHeight/ 3.24;
  static double splashImg160 = screenHeight/ 5.28;

}
