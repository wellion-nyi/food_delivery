import 'package:food_delivery/pages/cart/cart_page.dart';
import 'package:food_delivery/pages/food/pupular_foo_detail.dart';
import 'package:food_delivery/pages/food/recomened_food_detial.dart';
import 'package:food_delivery/pages/home/home_page.dart';
import 'package:food_delivery/pages/splash/splash_page.dart';
import 'package:get/route_manager.dart';

class RouteHelpaer {
  static const String splashScreen = "/splash-page";
  static const String initial = "/";
  static const String cartPage = "/cart-page";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";

  static String getSplashScreen() => '$splashScreen';
  static String getInitial() => '$initial';
  static String getCartPage() => '$cartPage';
  static String getPoupularFood(int pageId, String page) =>
      '$popularFood?pageId=$pageId&page=$page';
  static String getRecommendedFood(int pageId, String page) =>
      '$recommendedFood?pageId=$pageId&page=$page';

  static List<GetPage> routes = [
    GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(
        name: initial,
        page: () => HomePage(),
        transition: Transition.cupertino),
    GetPage(
        name: cartPage,
        page: () {
          return CartPage();
        },
        transition: Transition.cupertino),
    GetPage(
        name: popularFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters['page'];
          return PopularFoodDetail(
            pageId: int.parse(pageId!),
            page: page!,
          );
        },
        transition: Transition.cupertino),
    GetPage(
        name: recommendedFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters['page'];
          return RecomenedFoodDetail(pageId: int.parse(pageId!), page: page!);
        },
        transition: Transition.cupertino),
  ];
}
