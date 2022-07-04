import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/small_text.dart';

class ExandableTextWidget extends StatefulWidget {
  final String text;
  const ExandableTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  State<ExandableTextWidget> createState() => _ExandableTextWidgetState();
}

class _ExandableTextWidgetState extends State<ExandableTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool hinddenText = true;
  double textHight = Dimensions.screenHeight / 2.60;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHight) {
      firstHalf = widget.text.substring(0, textHight.toInt());
      secondHalf =
          widget.text.substring(textHight.toInt()+1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(
              text: firstHalf,
              size: Dimensions.font15,
              color: AppColors.paraColor,
              height: 1.5,
            )
          : Column(
              children: [
                SmallText(
                  text:
                      hinddenText ? (firstHalf + '') : (firstHalf + secondHalf),
                  size: Dimensions.font15,
                  color: AppColors.paraColor,
                  height: 1.5,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      hinddenText = !hinddenText;
                    });
                  },
                  child: Row(
                    children: [
                      hinddenText
                          ? SmallText(
                              text: 'Show more',
                              color: AppColors.mainColor,
                              size: Dimensions.font15,
                            )
                          : SmallText(
                              text: 'Hide more',
                              color: AppColors.mainColor,
                              size: Dimensions.font15,
                            ),
                      Icon(
                        hinddenText
                            ? Icons.arrow_drop_down
                            : Icons.arrow_drop_up,
                        color: AppColors.mainColor,
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
