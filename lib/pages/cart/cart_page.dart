import 'package:flutter/material.dart';
import 'package:food_delivery/controller/cart_controller.dart';
import 'package:food_delivery/controller/popular_product_controller.dart';
import 'package:food_delivery/controller/recommended_product_controller.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

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
                    GestureDetector(
                      onTap: (() {
                        Get.back();
                      }),
                      child: AppIcon(
                        icon: Icons.arrow_back_ios,
                        iconColor: Colors.white,
                        backgroundColor: AppColors.mainColor,
                        iconSize: Dimensions.icon25,
                      ),
                    ),
                    SizedBox(
                      width: Dimensions.width20 * 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelpaer.getInitial());
                      },
                      child: AppIcon(
                        icon: Icons.home_outlined,
                        iconColor: Colors.white,
                        backgroundColor: AppColors.mainColor,
                        iconSize: Dimensions.icon25,
                      ),
                    ),
                    GetBuilder<PopularProductController>(builder: (controller) {
                      return Stack(
                        children: [
                          AppIcon(
                            icon: Icons.shopping_cart_outlined,
                            iconColor: Colors.white,
                            backgroundColor: AppColors.mainColor,
                            iconSize: Dimensions.icon25,
                          ),
                        ],
                      );
                    })
                  ],
                )),
            Positioned(
                top: Dimensions.height100,
                left: Dimensions.width20,
                right: Dimensions.width20,
                bottom: 0,
                child: Container(
                  margin: EdgeInsets.only(top: Dimensions.height20),
                  //color: Colors.red,
                  child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child:
                          GetBuilder<CartController>(builder: (cartController) {
                        var _cartList = cartController.getItems;
                        return ListView.builder(
                            itemCount: _cartList.length,
                            itemBuilder: (_, index) {
                              return Container(
                                width: double.maxFinite,
                                height: Dimensions.height100,
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        var popularIndex =
                                            Get.find<PopularProductController>()
                                                .popularProductList
                                                .indexOf(
                                                    _cartList[index].product);
                                        if (popularIndex >= 0) {
                                          Get.toNamed(
                                              RouteHelpaer.getPoupularFood(
                                                  popularIndex, 'cartpage'));
                                        } else {
                                          var recommendedIndex = Get.find<
                                                  RecommendedProductController>()
                                              .recommendedProductList
                                              .indexOf(
                                                  _cartList[index].product);
                                          Get.toNamed(
                                              RouteHelpaer.getRecommendedFood(
                                                  recommendedIndex,
                                                  'cartpage'));
                                        }
                                      },
                                      child: Container(
                                        width: Dimensions.width100,
                                        height: Dimensions.height100,
                                        margin: EdgeInsets.only(
                                            bottom: Dimensions.height10),
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(AppConstants
                                                        .BASE_URL +
                                                    AppConstants.UPLOAD_URL +
                                                    cartController
                                                        .getItems[index].img!)),
                                            borderRadius: BorderRadius.circular(
                                                Dimensions.radius20),
                                            color: Colors.white),
                                      ),
                                    ),
                                    SizedBox(
                                      width: Dimensions.width10,
                                    ),
                                    Expanded(
                                        child: Container(
                                      //height: Dimensions.height100,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          BigText(
                                              text: cartController
                                                  .getItems[index].name!),
                                          SmallText(text: 'Spacy'),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              BigText(
                                                text: '\$ ' +
                                                    cartController
                                                        .getItems[index].price
                                                        .toString(),
                                                color: Colors.redAccent,
                                              ),
                                              Container(
                                                padding: EdgeInsets.all(
                                                    Dimensions.width10),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            Dimensions
                                                                .radius15),
                                                    color: Colors.white),
                                                child: Row(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: (() {
                                                        cartController.addItem(
                                                            _cartList[index]
                                                                .product!,
                                                            -1);
                                                      }),
                                                      child: Icon(
                                                        Icons.remove,
                                                        color:
                                                            AppColors.signColor,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          Dimensions.width10 /
                                                              2,
                                                    ),
                                                    BigText(
                                                      text: _cartList[index]
                                                          .quantity
                                                          .toString(),
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          Dimensions.width10 /
                                                              2,
                                                    ),
                                                    GestureDetector(
                                                      onTap: (() {
                                                        cartController.addItem(
                                                            _cartList[index]
                                                                .product!,
                                                            1);
                                                      }),
                                                      child: Icon(
                                                        Icons.add,
                                                        color:
                                                            AppColors.signColor,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ))
                                  ],
                                ),
                              );
                            });
                      })),
                ))
          ],
        ),
        bottomNavigationBar:
            GetBuilder<CartController>(builder: (cartController) {
          return Container(
            height: Dimensions.height120,
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.width20, vertical: Dimensions.height20),
            decoration: BoxDecoration(
              color: AppColors.buttonBackgroundColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius20),
                  topRight: Radius.circular(Dimensions.radius20)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(Dimensions.width20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                      color: Colors.white),
                  child: Row(
                    children: [
                      SizedBox(
                        width: Dimensions.width10 / 2,
                      ),
                      BigText(
                        text: '\$ ' + cartController.totalAmount.toString(),
                      ),
                      SizedBox(
                        width: Dimensions.width10 / 2,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: (() {
                    //  popularProduct.addItem(product);
                    cartController.addToHistory();
                  }),
                  child: Container(
                    padding: EdgeInsets.all(Dimensions.width20),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15),
                        color: AppColors.mainColor),
                    child: BigText(
                      text: 'Check out',
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          );
        }));
  }
}
