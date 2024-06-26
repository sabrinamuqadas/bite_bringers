import 'package:bite_bringers/utils/colors.dart';
import 'package:bite_bringers/utils/dimensions.dart';
import 'package:bite_bringers/widgets/account_widget.dart';
import 'package:bite_bringers/widgets/app_icon.dart';
import 'package:bite_bringers/widgets/big_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: Center(
          child: BigText(
              text: "Profile", size: 24, color: Colors.white,),
        ),
      ),
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: Dimensions.height20),
        child: Column(
          children: [
            //profile icon
            AppIcon(icon: Icons.person,
            backgroundColor: AppColors.mainColor,
            iconColor: Colors.white,
            iconSize: Dimensions.height45+Dimensions.height30,
            size: Dimensions.height15*10,),
            SizedBox(height: Dimensions.height30,),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //name
                  AccountWidget(
                      appIcon: AppIcon(icon: Icons.person,
                        backgroundColor: AppColors.mainColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10*5/2,
                        size: Dimensions.height10*5,),
                      bigText: BigText(text: "Sabrina Muqadas")),
                  SizedBox(height: Dimensions.height20,),
                  //phone
                  AccountWidget(
                      appIcon: AppIcon(icon: Icons.phone,
                        backgroundColor: AppColors.yellowColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10*5/2,
                        size: Dimensions.height10*5,),
                      bigText: BigText(text: "03364568273")),
                  SizedBox(height: Dimensions.height20,),
                  //email
                  AccountWidget(
                      appIcon: AppIcon(icon: Icons.email,
                        backgroundColor: AppColors.yellowColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10*5/2,
                        size: Dimensions.height10*5,),
                      bigText: BigText(text: "sabrinamuqadas@gmail.com")),
                  SizedBox(height: Dimensions.height20,),
                  //address
                  AccountWidget(
                      appIcon: AppIcon(icon: Icons.location_on,
                        backgroundColor: AppColors.yellowColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10*5/2,
                        size: Dimensions.height10*5,),
                      bigText: BigText(text: "Fill in your location")),
                  SizedBox(height: Dimensions.height20,),
                  //message
                  AccountWidget(
                      appIcon: AppIcon(icon: Icons.message_outlined,
                        backgroundColor: Colors.redAccent,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10*5/2,
                        size: Dimensions.height10*5,),
                      bigText: BigText(text: "Hi, how are you?")),
                  SizedBox(height: Dimensions.height20,),
                  AccountWidget(
                      appIcon: AppIcon(icon: Icons.message_outlined,
                        backgroundColor: Colors.redAccent,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10*5/2,
                        size: Dimensions.height10*5,),
                      bigText: BigText(text: "Hi, how are you?")),
                  SizedBox(height: Dimensions.height20,),
                  AccountWidget(
                      appIcon: AppIcon(icon: Icons.message_outlined,
                        backgroundColor: Colors.redAccent,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10*5/2,
                        size: Dimensions.height10*5,),
                      bigText: BigText(text: "Hi, how are you?")),
                  SizedBox(height: Dimensions.height20,),
                ],
              ),
            ),
          ),
          ],
        ),
      ),
    );
  }
}
