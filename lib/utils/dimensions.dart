import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  // 781/? //! 781 ကို ကိုယ်ယူထားရေ hight တိ width နဲ့စားပလိုက်ပြီးကေ အကြွင်းကိုယူထားစော်
  //! 781 စော် phone hight screen ဖြစ်တေ

  //For conatainer , Row and Colum height
  static double pageView = screenHeight / 2.60;
  static double pageViewContainer = screenHeight / 3.55;
  static double pageViewTextContainer = screenHeight / 6.50;

  //For dynamic height padding , margin and sizeBox
  static double height5 = screenHeight / 156.2;
  static double height10 = screenHeight / 78.1;
  static double height15 = screenHeight / 52.06;
  static double height20 = screenHeight / 39.05;
  static double height45 = screenHeight / 17.35;
  static double height50 = screenHeight / 15.62;
  static double height75 = screenHeight / 10.41;
  static double height100 = screenHeight / 7.81;
  static double height120 = screenHeight / 6.50;
  //For dynamic width padding and margin
  static double width10 = screenHeight / 78.1;
  static double width15 = screenHeight / 52.06;
  static double width20 = screenHeight / 39.05;
  static double width30 = screenHeight / 26.03;
  static double width45 = screenHeight / 17.35;
  static double width100 = screenHeight / 7.81;
  //static double width120 = screenHeight/6.50;

  //For dynamic Fonts
  static double font20 = screenHeight / 39.05;
  static double font12 = screenHeight / 65.08;
  static double font15 = screenHeight / 52.06;
  static double font26 = screenHeight / 30.03;

  //For dynamic icons
  static double icon16 = screenHeight / 48.81;
  static double icon20 = screenHeight / 39.05;
  static double icon25 = screenHeight / 31.24;
  static double icon30 = screenHeight / 26.03;
  static double icon40 = screenHeight / 19.52;

  //For dynamic navigation height
  static double navheight65 = screenHeight / 12.01;
  static double navheight15 = screenHeight / 52.06;
  //For dynamic navigation width
  static double navwidth20 = screenHeight / 39.05;

  //For dynamic radius
  static double radius20 = screenHeight / 39.05;
  static double radius30 = screenHeight / 26.03;
  static double radius15 = screenHeight / 52.06;

  //dynamic popular food image
  static double popularFoodImage = screenHeight / 2.60;

  //recoment food image hight
  static double recomentImageHight = screenHeight / 2.44;

  //! 392.7 စော် phone width screen ဖြစ်တေ
  //list view size
  static double listViewImageSize = screenWidth / 3.27;
  static double listViewTextContSize = screenWidth / 3.927;

  //splash photo
  static double splashImageSize = screenWidth / 3.25;
}
