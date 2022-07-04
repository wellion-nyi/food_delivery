import 'package:food_delivery/controller/popular_product_controller.dart';
import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/data/repository/popular_producg_repo.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';

Future<void> init() async{
  //this is apiClient
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //this is Repositroy
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

  //this is Controller
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}