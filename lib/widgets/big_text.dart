import 'package:bite_bringers/utils/dimensions.dart';
import 'package:flutter/cupertino.dart';

class BigText extends StatelessWidget {
   Color? color;
  final String text;
  double size;
  TextOverflow overflow;

  BigText(
      {super.key,
      this.color = const Color(0xFF332d2b),
      required this.text,
      this.overflow = TextOverflow.ellipsis,
      this.size = 0});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        fontFamily: 'Roboto',
        color: color,
        fontSize: size==0?Dimensions.font20:size,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
