import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:list_order/models/order_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String _baseUrl = 'https://desafiotecnicosti3.azurewebsites.net/pedido';
  Box<OrderModel> orderBox = Hive.box<OrderModel>('orders');

  Future<List<OrderModel>> fetchData() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<OrderModel> orders =
          data.map((item) => OrderModel.fromJson(item)).toList();
      await orderBox.clear();
      for (var order in orders) {
        orderBox.add(order);
      }
      return orders;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
