import 'package:crypto_hub/controllers/coin_value_controller.dart';
import 'package:crypto_hub/controllers/home_controller.dart';
import 'package:crypto_hub/controllers/market_controller.dart';
import 'package:get/get.dart';

class GetxBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
          () => HomeController(),
    );
    Get.lazyPut(
          () => CoinValueController(),
    );
    Get.lazyPut(
          () => MarketController(),
    );
  }
}