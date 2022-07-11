import 'package:banhang/repository/repository.dart';
import 'package:get/get.dart';

//su ly api
class Controller extends GetxController {
  var isLoading = true.obs;
  var groceryList = [].obs;

  @override
  void onInit() {
    fetch();
    super.onInit();
  }

  void fetch() async {
    try {
      isLoading(true);
      var groceries = (await Repo.getData())?.data!.products.results;
      if (groceries != null) {
        //rx khoi tao gt
        Rx(groceryList.value = groceries);
      }
    } finally {
      isLoading(false);
    }
  }
}
