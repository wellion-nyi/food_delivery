import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_delivery/controller/popular_product_controller.dart';
import 'package:food_delivery/controller/recommended_product_controller.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  Future<void> _loadResource() async {
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }

  final style = TextStyle(
      fontFamily: 'DancingScript',
      fontSize: Dimensions.height50,
      color: AppColors.mainColor,
      fontWeight: FontWeight.bold);

  /* //! နားမလည်ကေ video file ကို ပြန်ကြည့်
      this is explained //!..forward()
      AnyClass(){
        newObject(){
            return ..
        }
      }
        
      var x = AnyClass..newObject();
      x = x.newObject()
      
      */

  @override
  void initState() {
    super.initState();
    _loadResource();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3))
          ..forward();
    animation = CurvedAnimation(parent: controller, curve: Curves.linear);

    Timer(
      Duration(seconds: 4),
      () => Get.offNamed(RouteHelpaer.getInitial()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: animation,
            child: Center(
              child: Image.asset(
                'assets/image/R.png',
                width: Dimensions.splashImageSize,
              ),
            ),
          ),
          ScaleTransition(
            scale: animation,
            child: Container(
              padding: EdgeInsets.only(top: Dimensions.height20),
              child: Center(
                child: Text(
                  'The Best Food',
                  style: style,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
