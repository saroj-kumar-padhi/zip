
import 'package:api/controllers/dashboard_controller.dart';
import 'package:api/views/details.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatelessWidget {
  final DashboardController dashboardController = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product List')),
      body: Obx(
        () => ListView.builder(
          itemCount: dashboardController.productList.length,
          itemBuilder: (context, index) {
            final product = dashboardController.productList[index];
            return InkWell(
            onTap: () {
               Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsPage(
          image: product.thumbnail,
          title: product.title,
          subtitle:product.price.toStringAsFixed(2),
        ),
      ),
    );
            },

              child: ListTile(
                leading: Image.network(product.thumbnail),
                title: Text(product.title),
                subtitle: Text('Price: \$${product.price.toStringAsFixed(2)}'),
              ),
            );
          },
        ),
      ),
    );
  }
}


