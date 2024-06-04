import 'package:bite_bringers/utils/dimensions.dart';
import 'package:bite_bringers/widgets/app_icon.dart';
import 'package:bite_bringers/widgets/big_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountWidget extends StatelessWidget {
  AppIcon appIcon;
  BigText bigText;
  AccountWidget({super.key, required this.appIcon, required this.bigText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: Dimensions.width20,
      top: Dimensions.height10,
      bottom: Dimensions.height10),
      child: Row(
        children: [
          appIcon,
          SizedBox(width: Dimensions.width20,),
          bigText,
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 1,
            offset: Offset(0, 2),
            color: Colors.grey.withOpacity(0.2),
          ),
        ]
      ),
    );
  }
}
