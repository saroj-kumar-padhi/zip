
import 'package:api/models/model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DashboardController extends GetxController {
  var productList = <Product>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      var url = Uri.parse('https://dummyjson.com/products');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body)['products'];
        final List<Product> products = jsonData.map((data) => Product.fromJson(data)).toList();
        productList.assignAll(products);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch products');
    }
  }
}
